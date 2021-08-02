import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp2app/Components/FromCreator.dart';
import 'package:whatsapp2app/Helpers/Storage.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Welcome to Whatsapp 2",
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Image.asset("assets/images/welcome-bg.png")),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      "NEXT",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      await Storage.setBoolean(StorageKeys.WELCOMESHOWN, true);
                      await Navigator.pushReplacementNamed(context, "/login");
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorLight,
                        minimumSize: Size(double.infinity, 30),
                        padding: EdgeInsets.all(12)),
                  ),
                  SizedBox(height: 30),
                  FromCreator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
