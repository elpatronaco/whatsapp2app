import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/User/UserModel.dart';

class OpenChat {
  User user;
  Message? message;

  OpenChat({required this.user, this.message});

  OpenChat.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        message = !!json["message"] ? Message.fromJson(json["message"]) : null;
}
