import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Components/ChatRow.dart';
import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Service/MessageService.dart';
import 'package:whatsapp2app/Store/Global/Reducer.dart';

class Home extends StatelessWidget {
  final MessageService _messageService = GetIt.instance<MessageService>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Whatsapp 2"),
          backgroundColor: const Color.fromRGBO(0, 94, 84, 1),
          bottom: TabBar(tabs: [
            Container(
              width: 20,
              child: const Tab(icon: Icon(Icons.camera_alt)),
            ),
            Container(
              width: 130,
              child: const Tab(text: "CHATS"),
            ),
            Container(
              width: 130,
              child: const Tab(text: "ESTADOS"),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            const Text("camara"),
            StoreConnector<GlobalState, List<OpenChat>>(
              converter: (store) => store.state.openChats,
              builder: (context, chats) {
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatRow(chats[index]);
                  },
                );
              },
            ),
            Text("estados")
          ],
        ),
      ),
    );
  }
}
