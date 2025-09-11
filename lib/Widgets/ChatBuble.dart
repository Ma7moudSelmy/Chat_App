import 'package:chat_app/Models/messages_Models.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 16),
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
