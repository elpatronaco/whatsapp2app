class UserAuthenticate {
  String phone;
  String password;

  UserAuthenticate({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {"phone": phone, "password": password};
}
