import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Components/FromCreator.dart';
import 'package:whatsapp2app/Helpers/Routes.dart';
import 'package:whatsapp2app/Helpers/Storage.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Service/MessageService.dart';
import 'package:whatsapp2app/Service/Service.dart';

class Splash extends StatefulWidget {
  late final Service service;
  late final MessageService messageService;

  Splash() {
    var getIt = GetIt.instance;
    service = getIt<Service>();
    messageService = getIt<MessageService>();
  }

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();

    Timer(Duration(seconds: 3), initApp);
  }

  Future<void> initApp() async {
    var isWelcomeShown = await Storage.getBoolean(StorageKeys.WELCOMESHOWN);
    var tokens = await Storage.getString(StorageKeys.TOKENS);

    if (tokens == null) {
      Navigator.pushReplacementNamed(
          context,
          isWelcomeShown != null && isWelcomeShown
              ? Routes.LOGIN
              : Routes.WELCOME);
      return;
    }

    var parsedTokens = Tokens.fromJson(jsonDecode(tokens));

    widget.service.client.options.headers["Authorization"] =
        "Bearer ${parsedTokens.idToken}";
    await widget.messageService.init(parsedTokens, context);

    await Navigator.pushReplacementNamed(context, Routes.CHATS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 10),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset("assets/images/icon.svg",
                    width: MediaQuery.of(context).size.width / 5),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FromCreator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
