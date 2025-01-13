import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/shared/gap.dart';

class BookCard extends StatelessWidget {
  final List<AudioBookEntity> listBook;
  final int index;

  const BookCard({super.key, required this.listBook, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                listBook[index].urlThumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap.h(w: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listBook[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            listBook[index].artist,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border,
                      color: StyleConst.whiteColor,
                    ),
                  ],
                ),
                const Gap.v(h: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '5 Chapters',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.headset,
                          size: 14,
                          color: StyleConst.whiteColor,
                        ),
                        const Gap.h(w: 4),
                        Text(
                          '45 min',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
