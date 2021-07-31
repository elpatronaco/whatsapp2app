class User {
  String id;
  String phone;
  String username;
  String? socketConnectionId;

  User(
      {required this.id,
      required this.phone,
      required this.username,
      this.socketConnectionId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        phone: json["phone"],
        username: json["username"],
        socketConnectionId: json["socketConnectionId"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "username": username,
        "socketConnectionId": socketConnectionId
      };
}
