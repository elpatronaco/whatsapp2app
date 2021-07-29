import 'package:flutter/material.dart';
import 'package:whatsapp2app/Pages/Home.dart';
import 'package:whatsapp2app/Pages/Login.dart';
import 'package:whatsapp2app/Pages/Welcome.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Whatsapp 2", initialRoute: "/welcome", routes: {
      "/welcome": (context) => Welcome(),
      "/login": (context) => Login(),
      "/chat": (context) => Home()
    });
  }
}
