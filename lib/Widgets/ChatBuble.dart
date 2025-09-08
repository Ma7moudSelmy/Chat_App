import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 260,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: KprimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Text(
        "Hello im a new user what about you ",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
