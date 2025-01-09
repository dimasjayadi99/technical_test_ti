import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/pages/audio_book_detail_page.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/widgets/best_seller_card.dart';
import 'package:talent_insider_test/app/features/audio_book/presentation/widgets/book_card.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/shared/gap.dart';
import '../data/models/book_model.dart';

class AudioBookPage extends StatelessWidget {
  const AudioBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildBestSeller(context),
                    const Gap.v(h: 32),
                    _buildMoreBooks(context),
                  ],
                ),
              )
            ],
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

  Widget _buildBestSeller(context) {
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
                            AudioBookDetailPage(bookModel: listBook[index])));
                  },
                  child: BestSellerCard(listBook: listBook, index: index));
            },
            separatorBuilder: (context, index) => const Gap.h(w: 24),
            itemCount: listBook.length,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreBooks(context) {
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
                          AudioBookDetailPage(bookModel: listBook[index])));
                },
                child: BookCard(listBook: listBook, index: index));
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
          itemCount: listBook.length,
        ),
      ],
    );
  }
}
