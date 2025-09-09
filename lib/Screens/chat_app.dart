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
        automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Klogo, height: 50),
            const SizedBox(width: 8),
            const Text("Chat", style: TextStyle(color: Colors.white)),
            SizedBox(height: 25),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ChatBuble();
              },

              itemCount: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                suffixIcon: Icon(Icons.send, color: KprimaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: KprimaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: KprimaryColor),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
