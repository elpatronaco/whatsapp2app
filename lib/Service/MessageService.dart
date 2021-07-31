import 'package:signalr_core/signalr_core.dart';
import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Models/Dto/User/UserModel.dart';

class MessageService {
  late final HubConnection _connection;

  List<Message> messages = [
    new Message(
      id: "1p1231asda",
      recipientId: "12i31pkasdasd",
      amISender: true,
      content: "hola",
      sentDate: DateTime.now(),
    ),
    new Message(
      id: "1p1231asda",
      recipientId: "12i31pkasdasd",
      amISender: true,
      content:
          "oñndoadspasdoasoidaoisjdoiansdoansodaosidoasidoasidoniaiosdnaosidoaisndoainsd",
      sentDate: DateTime.now(),
    ),
    new Message(
      id: "1p1231asda",
      recipientId: "12i31pkasdasd",
      amISender: false,
      content: "asjdasd ssssssasd  asddddda sdasada asdasdaisp dasdpa osd",
      sentDate: DateTime.now(),
    )
  ];
  List<OpenChat> chats = [
    new OpenChat(
      user: new User(
          id: "12312olasdas", phone: "666666666", username: "elpatronnn"),
      message: new Message(
        id: "asdo1ñ23p1k2l3",
        recipientId: "12312olasdas",
        amISender: true,
        content: "jajajajja",
        sentDate: new DateTime(2021, 7, 31, 10, 50),
      ),
    )
  ];

  Future init(Tokens tokens) async {
    _connection = HubConnectionBuilder()
        .withUrl("http://localhost:5000/hub",
            HttpConnectionOptions(logging: (_, value) {
              print("Signalr msg with payload: $value");
            }))
        .withAutomaticReconnect()
        .build();

    await _connection.start();

    registerEvents();

    await _connection.invoke("NewSession", args: [tokens.idToken]);
  }

  bool isConnected() {
    return _connection.state == HubConnectionState.connected;
  }

  void registerEvents() {
    _connection.on("Chats", (receivedChats) {
      if (receivedChats != null)
        chats = receivedChats.map((e) => OpenChat.fromJson(e)).toList();
    });

    _connection.on("Messages", (receivedMessages) {
      if (receivedMessages != null)
        messages = receivedMessages.map((e) => Message.fromJson(e)).toList();
    });
  }

  void sendMessage({required String message, required String recipientId}) {
    _connection.invoke("SendMessage", args: [message, recipientId]);
  }
}
