import 'package:flutter/material.dart';
import '../../../../core/shared/gap.dart';
import '../data/models/book_model.dart';

class BestSellerCard extends StatelessWidget {
  final List<BookModel> listBook;
  final int index;

  const BestSellerCard(
      {super.key, required this.listBook, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              listBook[index].imagePath,
              fit: BoxFit.cover,
              height: 185,
            ),
          ),
          const Gap.v(h: 16),
          Text(
            listBook[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            listBook[index].author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
