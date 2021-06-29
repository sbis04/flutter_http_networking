class Post {
  Post({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  int? id;
  int? userId;
  String? title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
