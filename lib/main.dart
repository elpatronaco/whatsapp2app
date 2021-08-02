import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:whatsapp2app/Helpers/Routes.dart';
import 'package:whatsapp2app/Pages/Home.dart';
import 'package:whatsapp2app/Pages/Login.dart';
import 'package:whatsapp2app/Pages/Splash.dart';
import 'package:whatsapp2app/Pages/Welcome.dart';
import 'package:whatsapp2app/Service/Service.dart';
import 'package:whatsapp2app/Service/MessageService.dart';
import 'package:whatsapp2app/Store/Global/Reducer.dart';

void main() {
  GestureBinding.instance?.resamplingEnabled = true;
  final Store<GlobalState> store = Store<GlobalState>(globalReducer,
      initialState: GlobalState.initialState());

  runApp(App(title: "Whatsapp 2", store: store));
}

class App extends StatefulWidget {
  final Store<GlobalState> store;
  final String title;

  App({required this.store, required this.title});

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
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        initialRoute: Routes.SPLASH,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(15, 142, 123, 1),
          primaryColorLight: Color.fromRGBO(1, 204, 61, 1),
        ),
        title: widget.title,
        routes: {
          Routes.SPLASH: (context) => Splash(),
          Routes.WELCOME: (context) => Welcome(),
          Routes.LOGIN: (context) => Login(),
          Routes.CHATS: (context) => Home()
        },
      ),
    );
  }
}
