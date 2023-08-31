class UserModel {
  final int id;
  final String name;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'password': password,
  };
}