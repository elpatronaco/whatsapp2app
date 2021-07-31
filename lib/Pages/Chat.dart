import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp2app/Components/Message.dart';
import 'package:whatsapp2app/Service/MessageService.dart';

class Chat extends StatelessWidget {
  final MessageService messageService = GetIt.instance<MessageService>();

  final TextEditingController _messageController = new TextEditingController();

  void handleSend() {
    if (_messageController.text != "")
      messageService.sendMessage(
          message: _messageController.text, recipientId: "adsnaskdasjd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/chat-bg.png"),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext ctx, int index) {
                      return SizedBox(
                          height: messageService.messages[index].amISender !=
                                  messageService.messages[index + 1].amISender
                              ? 10
                              : 2);
                    },
                    itemCount: messageService.messages.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return MessageWidget(messageService.messages[index]);
                    },
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          minLines: 1,
                          maxLines: 6,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Type a message",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  style: BorderStyle.none, width: 0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: RawMaterialButton(
                            onPressed: handleSend,
                            child: const Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white),
                            fillColor: Theme.of(context).primaryColor,
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
