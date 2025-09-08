import 'dart:math';

import 'package:chat_app/Widgets/ChatBuble.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  static String id = "chat_page";

  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KprimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Klogo, height: 50),
            const SizedBox(width: 8),
            const Text("School Chat", style: TextStyle(color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: ChatBuble(),
    );
  }
}
