class LoginReqModel {
  int id;
  String password;

  LoginReqModel({
    required this.id,
    required this.password,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) {
    return LoginReqModel(
      id: json['id'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'password': password,
  };
}

class LoginResModel {
  String jwt;

  LoginResModel({
    required this.jwt,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) {
    return LoginResModel(
      jwt: json['jwt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'jwt': jwt,
  };
}