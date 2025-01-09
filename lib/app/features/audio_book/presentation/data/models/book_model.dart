class BookModel {
  final String title;
  final String author;
  final String imagePath;
  final String chapter;
  final String duration;

  BookModel(
      {required this.title,
      required this.author,
      required this.imagePath,
      required this.chapter,
      required this.duration});
}

final List<BookModel> listBook = [
  BookModel(
    title: 'The Power of Habit',
    author: 'Charles Duhigg',
    imagePath:
        'https://static.get-headway.com/9032dbf2efaa45f9a447-15cefef9cb0fb3.jpg',
    chapter: '16',
    duration: '40',
  ),
  BookModel(
    title: 'Atomic Habits',
    author: 'James Clear',
    imagePath:
        'https://th.bing.com/th/id/OIP.5QYD-Qzf3laaaL3T4EMBzgAAAA?rs=1&pid=ImgDetMain',
    chapter: '20',
    duration: '45',
  ),
  BookModel(
    title: 'Deep Work',
    author: 'Cal Newport',
    imagePath:
        'https://i.pinimg.com/originals/c2/7c/b6/c27cb67619405a00c14bcfcf78225225.jpg',
    chapter: '14',
    duration: '38',
  ),
  BookModel(
    title: 'Think and Grow Rich',
    author: 'Napoleon Hill',
    imagePath:
        'https://i.pinimg.com/736x/4a/25/6c/4a256c450ff22b0ed62558d6f3258984.jpg',
    chapter: '12',
    duration: '50',
  ),
  BookModel(
    title: 'The 7 Habits of Highly Effective People',
    author: 'Stephen R. Covey',
    imagePath:
        'https://fourminutebooks.com/wp-content/uploads/2020/11/self-help-books-2.jpg',
    chapter: '18',
    duration: '60',
  ),
];
