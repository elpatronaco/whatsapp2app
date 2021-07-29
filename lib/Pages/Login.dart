import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 94, 84, 1),
        toolbarHeight: 150,
        title: Center(
            child: SvgPicture.asset("assets/images/icon.svg",
                height: 60, width: 60)),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(children: [
          Text("Login to your account"),
          TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: "Número de teléfono"))
        ]),
      ),
    );
  }
}
