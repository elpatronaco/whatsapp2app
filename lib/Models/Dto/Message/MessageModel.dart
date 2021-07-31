class Message {
  String id;
  String recipientId;
  bool amISender;
  String content;
  DateTime sentDate;

  Message(
      {required this.id,
      required this.recipientId,
      required this.amISender,
      required this.content,
      required this.sentDate});

  Message.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        recipientId = json["recipientId"],
        amISender = json["amISender"],
        content = json["content"],
        sentDate = json["sentDate"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipientId": recipientId,
        "amISender": amISender,
        "content": content,
        "sentDate": sentDate
      };
}
