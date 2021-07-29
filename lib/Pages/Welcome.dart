import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome to Whatsapp 2",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(15, 142, 123, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 60),
          FractionallySizedBox(
              widthFactor: 0.6,
              child: Image.asset("assets/images/welcome-bg.png")),
          SizedBox(height: 60),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300),
            child: ElevatedButton(
              child: Text(
                "NEXT",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(1, 204, 61, 1),
                  minimumSize: Size(double.infinity, 30),
                  padding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(height: 60),
          Text("from", style: TextStyle(color: Colors.black54)),
          SizedBox(height: 6),
          Text(
            "ELPATRONACO",
            style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(1, 204, 61, 1),
            ),
          )
        ],
      ),
    );
  }
}
