import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp2app/Helpers/Storage.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Models/Dto/User/UserAuthenticate.dart';

class Service {
  final Dio client = new Dio(
    BaseOptions(
        baseUrl: "http://localhost:5000", contentType: "application/json"),
  );

  Future<bool> login(UserAuthenticate payload, BuildContext context) async {
    try {
      var resp = await client.post("/api/auth/login", data: payload.toJson());

      var tokens = Tokens.fromJson(resp.data);
      var serializedTokens = jsonEncode(tokens.toJson());

      await Storage.setString(StorageKeys.TOKENS, serializedTokens);
      client.options.headers["Authorization"] = "Bearer ${tokens.idToken}";

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
