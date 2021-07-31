class Tokens {
  String idToken;
  String accessToken;

  Tokens({required this.idToken, required this.accessToken});

  Tokens.fromJson(Map<String, dynamic> json)
      : idToken = json["idToken"],
        accessToken = json["accessToken"];

  Map<String, dynamic> toJson() =>
      {"idToken": idToken, "accessToken": accessToken};
}
