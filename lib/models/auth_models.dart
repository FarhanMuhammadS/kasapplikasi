class AuthModel {
  String email;
  String password;
  bool? returnSecureToken;
  AuthModel(
      {required this.email, required this.password, this.returnSecureToken});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      email: json['name'],
      password: json['password'],
      returnSecureToken: json['returnSecureToken']);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "returnSecureToken": returnSecureToken
      };
}
