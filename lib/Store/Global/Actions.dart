import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';

class SetMessagesAction {
  final List<Message> messages;

  SetMessagesAction(this.messages);
}

class SetOpenChatsAction {
  final List<OpenChat> openChats;

  SetOpenChatsAction(this.openChats);
}

class NewMessageAction {
  final Message newMessage;

  NewMessageAction(this.newMessage);
}
