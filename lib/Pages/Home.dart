import 'package:flutter/material.dart';
import 'package:whatsapp2app/Helpers/common.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 94, 84, 1),
            bottom: TabBar(isScrollable: true,  tabs: [
              Container(
                width: 20,
                child: Tab(icon: Icon(Icons.camera_alt)),
              ),
              Container(
                width: 130,
                child: Tab(text: "CHATS"),
              ),
              Container(
                width: 130,
                child: Tab(text: "ESTADOS"),
              ),
            ]),
          ),
        ));
  }
}
