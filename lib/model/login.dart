/*  @RohimahFebriantiohima : isi aja sesuai arahan kemarin
        untuk sementara nama modelsnya ini dulu, biar bisa 
        sama sama asynchronuz sama branch register.

        kalau ada salah/kurang tepat, perbaikin and confirm aja .
        
*/
class UserLogin {
  UserLogin({
    required this.email,
    required this.password,
  });

  String? email;
  String? password;

  factory UserLogin.fromJson(Map json) {
    return UserLogin(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
