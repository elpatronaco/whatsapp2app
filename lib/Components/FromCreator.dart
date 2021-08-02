import 'package:flutter/material.dart';

class FromCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          const Text("from", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 10),
          Text(
            "ELPATRONACO",
            style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).primaryColorLight,
            ),
          )
        ],
      ),
    );
  }
}
