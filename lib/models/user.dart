class User {
  final String id;
  final String email;
  final String name;
  final String nickname;
  final Map image;

  User(this.id, this.email, this.name, this.nickname, this.image);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        name = json["name"],
        nickname = json["nickname"],
        image = json["image"];
}
