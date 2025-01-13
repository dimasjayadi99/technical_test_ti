import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/main.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/dependency/injection_container.dart';
import '../../../../core/utils/duration_format_util.dart';
import '../bloc/audio_book_detail_bloc.dart';

class AudioBookDetailPage extends StatelessWidget {
  final String id;

  const AudioBookDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioBookDetailBloc>(
      create: (_) {
        final bloc = sl<AudioBookDetailBloc>();
        bloc.add(OnFetchData(id: id));
        return bloc;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: MediaQueryWrapper(
            child: BlocBuilder<AudioBookDetailBloc, AudioBookDetailState>(
              builder: (context, state) {
                if (state is AudioBookDetailLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AudioBookDetailFailedState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is AudioBookDetailSuccessState) {
                  return _buildContent(context, state);
                } else {
                  return const Center(
                    child: Text('Terjadi kesalahan saat menampilkan halaman'),
                  );
                }
              },
            ),
          ),
        ),
        backgroundColor: StyleConst.blackColor,
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, AudioBookDetailSuccessState state) {
    final bloc = context.read<AudioBookDetailBloc>();
    final data = state.data;
    Duration position = Duration.zero;
    Duration duration = Duration.zero;
    bool isPlaying = false;

    if (state is AudioPlayingState) {
      position = state.position;
      duration = state.duration;
      isPlaying = true;
    } else if (state is AudioPausedState) {
      position = state.position;
      duration = state.duration;
      isPlaying = false;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          data.urlThumb,
          width: MediaQuery.of(context).size.width,
          height: 400,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${data.artist} · UI/UX Designer",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // Tag
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.category, size: 16, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        "Soft Skill",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "Aug 4 · in English",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Slider(
              value: position.inSeconds
                  .toDouble()
                  .clamp(0.0, duration.inSeconds.toDouble()),
              min: 0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) {
                bloc.add(SeekAudio(position: Duration(seconds: value.toInt())));
              },
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(position),
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  formatDuration(duration),
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Audio Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous,
                      color: Colors.white, size: 32),
                  onPressed: () {
                    final newPosition = position - const Duration(seconds: 10);
                    bloc.add(SeekAudio(
                        position: newPosition > Duration.zero
                            ? newPosition
                            : Duration.zero));
                  },
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        bloc.add(PauseAudio());
                      } else {
                        bloc.add(PlayAudio());
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next,
                      color: Colors.white, size: 32),
                  onPressed: () {
                    final newPosition = position + const Duration(seconds: 10);
                    bloc.add(SeekAudio(
                        position:
                            newPosition < duration ? newPosition : duration));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: StyleConst.blackColor,
      title: const Text('PLAYING FROM SEARCH'),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: StyleConst.whiteColor,
          size: 28,
        ),
      ),
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: StyleConst.whiteColor),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            Icons.menu,
            color: StyleConst.whiteColor,
          ),
        ),
      ],
    );
  }
}
