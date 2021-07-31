class Tokens {
  String idToken;
  String accessToken;

  Tokens({required this.idToken, required this.accessToken});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(idToken: json["idToken"], accessToken: json["accessToken"]);
  }

  Map<String, dynamic> toJson() =>
      {"idToken": idToken, "accessToken": accessToken};
}
