import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/bloc/audio_book_bloc.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/pages/audio_book_detail_page.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/widgets/best_seller_card.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/widgets/book_card.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/dependency/injection_container.dart';
import '../../../../core/shared/gap.dart';

class AudioBookPage extends StatelessWidget {
  const AudioBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioBookBloc>(
      create: (_) {
        final bloc = sl<AudioBookBloc>();
        bloc.listAudioBooks();
        return bloc;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                    hintText: 'Search Keywords',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const Gap.v(h: 24),
                BlocBuilder<AudioBookBloc, AudioBookState>(
                  builder: (context, state) {
                    if (state is AudioBookLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AudioBookFailedState) {
                      return Center(child: Text(state.message));
                    } else if (state is AudioBookSuccessState) {
                      final data = state.books;
                      return Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildBestSeller(context, data),
                            const Gap.v(h: 32),
                            _buildMoreBooks(context, data),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                          child: Text(
                              'Terjadi kesalahan saat menampilkan halaman'));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      backgroundColor: StyleConst.blackColor,
      title: const Text('Audio Book'),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_outlined,
          color: StyleConst.whiteColor,
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
        )
      ],
    );
  }

  Widget _buildBestSeller(context, List<AudioBookEntity> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best-Sellers',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap.v(h: 16),
        SizedBox(
          height: 250,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AudioBookDetailPage(id: data[index].id)));
                  },
                  child: BestSellerCard(listBook: data, index: index));
            },
            separatorBuilder: (context, index) => const Gap.h(w: 24),
            itemCount: data.length,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreBooks(context, List<AudioBookEntity> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Books',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap.v(h: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AudioBookDetailPage(id: data[index].id)));
                },
                child: BookCard(listBook: data, index: index));
          },
          separatorBuilder: (context, index) {
            return Column(
              children: [
                const Gap.v(h: 16),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        StyleConst.blackColor,
                        StyleConst.whiteColor.withOpacity(0.3),
                        StyleConst.blackColor,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                const Gap.v(h: 16),
              ],
            );
          },
          itemCount: data.length,
        ),
      ],
    );
  }
}
