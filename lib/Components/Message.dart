import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp2app/Models/Dto/Message/MessageModel.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      alignment:
          message.amISender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.01,
                blurRadius: 0.05,
                offset: Offset(0, 0.8),
              )
            ],
            color: message.amISender
                ? Color.fromRGBO(225, 255, 199, 1)
                : Colors.white),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: SelectableText(message.content,
              textAlign: TextAlign.left, style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
