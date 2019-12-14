class Post {
  final int id;
  final String title;
  final String body;
  final String createdAt;
  final String updatedAt;

  Post(this.id, this.title, this.body, this.createdAt, this.updatedAt);

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        body = json["body"],
        createdAt = json["created_at"],
        updatedAt = json["updated_at"];
}
