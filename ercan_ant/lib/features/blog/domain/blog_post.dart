class BlogPost {
  const BlogPost({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.date,
    required this.category,
    required this.readingMinutes,
  });

  final String id;
  final String title;
  final String excerpt;
  final String content;
  final DateTime date;
  final String category;
  final int readingMinutes;
}
