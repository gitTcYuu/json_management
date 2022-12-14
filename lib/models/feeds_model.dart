class Feed {
  final int userId;
  final int id;
  final String title;
  final String body;

  Feed(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
