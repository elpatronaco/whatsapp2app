import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Helpers/Storage.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';
import 'package:whatsapp2app/Models/Dto/Tokens/Tokens.dart';
import 'package:whatsapp2app/Models/Dto/User/UserAuthenticate.dart';
import 'package:whatsapp2app/Service/MessageService.dart';
import 'package:whatsapp2app/Service/Service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Service _service = GetIt.instance<Service>();
  final MessageService _messageService = GetIt.instance<MessageService>();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  Future handleLogin() async {
    if (_formKey.currentState != null && !_formKey.currentState!.validate())
      return;

    _formKey.currentState!.save();

    var payload = new UserAuthenticate(
        phone: _phoneController.text, password: _passwordController.text);

    var result = await _service.login(payload, context);

    if (result) {
      final String? tokens = await Storage.getString(StorageKeys.TOKENS);

      if (tokens != null) {
        var parsedTokens = Tokens.fromJson(jsonDecode(tokens));

        await _messageService.init(parsedTokens, context);

        Navigator.pushReplacementNamed(context, "/chats");
      }
    } else
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("El teléfono o la contraseña son incorrectos"),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 94, 84, 1),
        toolbarHeight: 150,
        title: Center(
            child: SvgPicture.asset("assets/images/icon.svg",
                height: 60, width: 60)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState?.validate();
          },
          child: Column(children: [
            Text(
              "Login to your account",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Número de teléfono",
                border: UnderlineInputBorder(),
              ),
              validator: (String? value) {
                print(value?.length);
                if (value == null || value.isEmpty)
                  return "Este campo es requerido";
                if (value.length != 9)
                  return "Tiene que tener 9 dígitos exactos";
                if (double.tryParse(value) == null)
                  return "El teléfono tiene que ser un número";

                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty)
                  return "El campo es requerido";
                if (value.length < 8)
                  return "La contraseña debe tener un mínimo de 8 carácteres";

                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Contraseña",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                "LOGIN",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: handleLogin,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColorLight,
                minimumSize: const Size(double.infinity, 30),
                padding: const EdgeInsets.all(12),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
