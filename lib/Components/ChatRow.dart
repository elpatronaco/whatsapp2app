import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp2app/Helpers/Common.dart';
import 'package:whatsapp2app/Models/Dto/Chat/OpenChat.dart';
import 'package:whatsapp2app/Pages/Chat.dart';

class ChatRow extends StatelessWidget {
  final OpenChat openChat;

  ChatRow(this.openChat);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Chat()));
      },
      child: Container(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FractionallySizedBox(
                heightFactor: 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://i0.wp.com/in03.hostcontrol.com/resources/0bc96a6dd6bb4a/472cec2299.JPEG",
                  ),
                ),
              ),
              SizedBox(width: 20),
              openChat.lastMessage != null
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                openChat.recipient.username,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                getLastMessageFormattedDate(
                                    openChat.lastMessage!.sentDate),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Text(
                              openChat.lastMessage!.content,
                              style: TextStyle(
                                color: Color.fromRGBO(116, 116, 116, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Text(
                      openChat.recipient.username,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
