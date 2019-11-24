class User {
  final String id;
  final String email;
  final String name;
  final String nickname;
  final Map image;
  final String error;

  User(this.id, this.email, this.name, this.nickname, this.image, this.error);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        name = json["name"],
        nickname = json["nickname"],
        image = json["image"],
        error = '';

  User.withError(String errorValue)
      : id = '',
        email =  '',
        name =  '',
        nickname =  '',
        image =  Map(),
        error = errorValue;
}
