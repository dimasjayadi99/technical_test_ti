import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/core/shared/custom_button.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/lesson_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/consts/path.dart';
import '../../../../core/dependency/injection_container.dart';
import '../../../../core/shared/gap.dart';
import 'package:chewie/chewie.dart';

class LessonPage extends StatefulWidget {
  final String idLesson;
  final String titleLesson;

  const LessonPage(
      {super.key, required this.idLesson, required this.titleLesson});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  bool _isPlayerInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializePlayer(String filePath) async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(filePath),
    );

    try {
      await _controller!.initialize();
      _chewieController = ChewieController(
          videoPlayerController: _controller!,
          aspectRatio: _controller!.value.aspectRatio,
          autoPlay: false,
          looping: false,
          autoInitialize: true,
          showOptions: false,
          showControls: true);

      setState(() {
        _isPlayerInitialized = true;
      });
    } catch (e) {
      setState(() {
        _isPlayerInitialized = false;
      });
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonBloc>(
      create: (context) {
        final bloc = sl<LessonBloc>();
        bloc.fetchData(widget.idLesson);
        return bloc;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton().previousButton(),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Chapter 1 : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Introduction to t...',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
              CustomButton().nextButton(),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<LessonBloc, LessonState>(
            builder: (context, state) {
              if (state is LessonLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LessonFailedState) {
                return Center(child: Text(state.message));
              } else if (state is LessonSuccessState) {
                final data = state.lesson;

                if (!_isPlayerInitialized) {
                  _initializePlayer(data.filePath);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: Chewie(
                        controller: _chewieController!,
                      ),
                    ),
                    const Gap.v(h: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lesson 1",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap.v(h: 8),
                          Text(
                            widget.titleLesson,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Gap.v(h: 8),
                          Row(
                            children: [
                              const Text(
                                "Created by Diego Davila",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const Spacer(),
                              ClipOval(
                                child: Image.asset(
                                  PathConst.defaultFlag,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap.h(w: 8),
                              Text(
                                'in English',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap.v(h: 16),
                    Expanded(
                      child: Container(
                        color: Colors.grey[850],
                        child: ListView(
                          children: [
                            _buildContentCard(
                              "Lesson 1",
                              "Welcome to 23 Ways of Earning Money with AI",
                              "02:30",
                              'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                            ),
                            _buildContentCard(
                              "PDF",
                              "The ChatGPT Prompts Guide",
                              "15:00",
                              'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                            ),
                            _buildContentCard(
                              "Lesson 2",
                              "Get Started with ChatGPT",
                              "18:00",
                              'https://www.worldtesolacademy.com/wp-content/uploads/online-lessons-banner.jpg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    'Terjadi kesalahan saat menampilkan halaman',
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard(
      String title, String subtitle, String duration, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 120,
              height: 80,
            ),
          ),
          const Gap.h(w: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Gap.v(h: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Gap.v(h: 8),
                Text(
                  duration,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
