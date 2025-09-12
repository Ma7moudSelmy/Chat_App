import 'package:chat_app/Models/messages_Models.dart';
import 'package:chat_app/Widgets/ChatBuble.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp extends StatelessWidget {
  ChatApp({super.key});
  static String id = "chat_page";
  final ScrollController _controller = ScrollController();
  final TextEditingController controller = TextEditingController();
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    KeyMessageCollections,
  );

  void sendMessage(email, String data) {
    messages.add({KMessage: data, KCreatedAt: DateTime.now(), 'id': email});
    controller.clear();
    _controller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
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
                  const SizedBox(height: 25),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      return messageslist[index].id == email
                          ? ChatBuble(message: messageslist[index])
                          : ChatBubleforfrined(message: messageslist[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      if (data.isNotEmpty) {
                        sendMessage(email, data);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: KprimaryColor),
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            sendMessage(email, controller.text);
                          }
                        },
                      ),
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
          return const Center(child: Text("Loading..."));
        }
      },
    );
  }
}
