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

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        phone = json["phone"],
        username = json["username"],
        socketConnectionId = json["socketConnectionId"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "username": username,
        "socketConnectionId": socketConnectionId
      };
}
