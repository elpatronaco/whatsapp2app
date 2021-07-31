import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/User/UserModel.dart';

class OpenChat {
  User recipient;
  Message? lastMessage;

  OpenChat({required this.recipient, this.lastMessage});

  factory OpenChat.fromJson(Map<String, dynamic> json) {
    return OpenChat(
        recipient: User.fromJson(json["recipient"]),
        lastMessage: json["lastMessage"] != null
            ? Message.fromJson(json["lastMessage"])
            : null);
  }
}
