import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Helpers/Storage.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Models/Dto/User/UserAuthenticate.dart';
import 'package:whatsapp2app/Service/MessageService.dart';

class Service {
  final Dio client = new Dio(
    BaseOptions(
        baseUrl: "http://localhost:5000", contentType: "application/json"),
  );
  final GetIt getIt = GetIt.instance;

  Future<bool> login(UserAuthenticate payload) async {
    try {
      var resp = await client.post("/api/auth/login", data: payload.toJson());

      var tokens = Tokens.fromJson(resp.data);
      var serializedTokens = jsonEncode(tokens.toJson());

      await Storage.setString(StorageKeys.TOKENS, serializedTokens);
      await getIt<MessageService>().init(tokens);

      return true;
    } catch (_) {
      return false;
    }
  }
}
