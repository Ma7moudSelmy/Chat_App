import 'dart:math';

import 'package:chat_app/Models/messages_Models.dart';
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

  get Messages => null;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt).snapshots(),

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageslist = [];
          for (int i = 0; snapshot.data!.docs.length > i; i++) {
            messageslist.add(
              Message.formJson(
                snapshot.data!.docs[i].data() as Map<String, dynamic>,
              ),
            );
          }
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
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      return ChatBuble(message: messageslist[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        KMessage: data,
                        KCreatedAt: DateTime.now(),
                      });
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
        } else {
          return Center(child: Text("Loading..."));
        }
      },
    );
  }
}
