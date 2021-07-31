import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Pages/Home.dart';
import 'package:whatsapp2app/Pages/Login.dart';
import 'package:whatsapp2app/Pages/Welcome.dart';
import 'package:whatsapp2app/Service/Service.dart';
import 'package:whatsapp2app/Service/MessageService.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    registerServices();
  }

  registerServices() {
    final GetIt getIt = GetIt.instance;

    getIt.registerSingleton<MessageService>(MessageService());
    getIt.registerSingleton<Service>(Service());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Whatsapp 2",
      initialRoute: "/welcome",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(15, 142, 123, 1),
        primaryColorLight: Color.fromRGBO(1, 204, 61, 1),
      ),
      routes: {
        "/welcome": (context) => Welcome(),
        "/login": (context) => Login(),
        "/chats": (context) => Home()
      },
    );
  }
}
