import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:just_audio/just_audio.dart';
import 'package:redux/redux.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Models/Dto/User/UserModel.dart';
import 'package:whatsapp2app/Store/Global/Actions.dart';
import 'package:whatsapp2app/Store/Global/Reducer.dart';

class MessageService {
  late final HubConnection? _connection;
  late final Store<GlobalState> store;

  Future init(Tokens tokens, BuildContext context) async {
    store = StoreProvider.of(context);

    _connection = HubConnectionBuilder()
        .withUrl("http://localhost:5000/hub",
            HttpConnectionOptions(logging: (_, value) {
          print("Signalr msg with payload: $value");
        }))
        .withAutomaticReconnect()
        .build();

    registerEvents();

    await _connection?.start();

    await _connection?.invoke("NewSession", args: [tokens.idToken]);
  }

  bool isConnected() {
    return _connection != null
        ? _connection?.state == HubConnectionState.connected
        : false;
  }

  void registerEvents() {
    _connection?.on("Chats", (params) {
      if (params != null && params[0] != null && params[0] is List<dynamic>) {
        var chats = (params[0] as List<dynamic>)
            .map((e) => OpenChat.fromJson(e))
            .toList();

        store.dispatch(SetOpenChatsAction(chats));
      }
    });

    _connection?.on("Messages", (params) {
      if (params != null && params[0] != null && params[0] is List<dynamic>) {
        var messages = (params[0] as List<dynamic>)
            .map((e) => Message.fromJson(e))
            .toList();

        store.dispatch(SetMessagesAction(messages));
      }
    });

    _connection?.on("New Message", (params) {
      if (params != null && params[0] != null) {
        var message = Message.fromJson(params[0]);

        final player = AudioPlayer();
        player
          ..setAsset(
              "assets/sounds/${message.amISender ? "in" : "out"}_sound.mp3")
          ..setVolume(message.amISender ? 0.5 : 1)
          ..play();

        store.dispatch(NewMessageAction(message));
      }
    });
  }

  void sendMessage({required String message, required String recipientId}) {
    if (_connection != null && isConnected())
      _connection!.invoke("SendMessage", args: [message, recipientId]);
  }

  void openChat(User recipient) {
    if (_connection != null && isConnected())
      _connection!.invoke("OpenChat", args: [recipient.id]);
  }
}
