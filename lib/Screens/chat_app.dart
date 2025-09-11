import 'package:chat_app/Widgets/ChatBuble.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp extends StatelessWidget {
  ChatApp({super.key});
  static String id = "chat_page";
  TextEditingController controller = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KeyMessageCollections,
  );

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
              controller: controller,
              onSubmitted: (data) {
                messages.add({'messages': data});
                controller.clear();
              },
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
