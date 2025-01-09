import 'package:talent_insider_test/app/core/consts/path.dart';

class BookModel {
  final String title;
  final String author;
  final String imagePath;
  final String chapter;
  final String duration;
  final String audioUrl;

  BookModel(
      {required this.title,
      required this.author,
      required this.imagePath,
      required this.chapter,
      required this.duration,
      required this.audioUrl});
}

final List<BookModel> listBook = [
  BookModel(
    title: 'The Power of Habit',
    author: 'Charles Duhigg',
    imagePath: PathConst.audioBook1,
    chapter: '16',
    duration: '40',
    audioUrl: PathConst.audioBookUrl,
  ),
  BookModel(
    title: 'Atomic Habits',
    author: 'James Clear',
    imagePath: PathConst.audioBook2,
    chapter: '20',
    duration: '45',
    audioUrl: PathConst.audioBookUrl,
  ),
  BookModel(
    title: 'Deep Work',
    author: 'Cal Newport',
    imagePath: PathConst.audioBook3,
    chapter: '14',
    duration: '38',
    audioUrl: PathConst.audioBookUrl,
  ),
  BookModel(
    title: 'Think and Grow Rich',
    author: 'Napoleon Hill',
    imagePath: PathConst.audioBook4,
    chapter: '12',
    duration: '50',
    audioUrl: PathConst.audioBookUrl,
  ),
  BookModel(
    title: 'The 7 Habits of Highly Effective People',
    author: 'Stephen R. Covey',
    imagePath: PathConst.audioBook5,
    chapter: '18',
    duration: '60',
    audioUrl: PathConst.audioBookUrl,
  ),
];
