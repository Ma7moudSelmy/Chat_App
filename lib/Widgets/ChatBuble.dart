import 'package:chat_app/Models/messages_Models.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({super.key, required this.message});
  final Message message;

  final String userAvatarPath =
      'assets/images/WhatsApp Image 2025-09-12 at 16.34.47_4470dfc1.jpg';

  Widget _avatar(String path) {
    return ClipOval(
      child: Image.asset(path, width: 40, height: 40, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: KprimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _avatar(userAvatarPath),
        ],
      ),
    );
  }
}

class ChatBubleforfrined extends StatelessWidget {
  ChatBubleforfrined({super.key, required this.message});
  final Message message;

  final String friendAvatarPath =
      'assets/images/WhatsApp Image 2025-09-12 at 16.30.52_8ec6fdaf.jpg';

  Widget _avatar(String path) {
    return ClipOval(
      child: Image.asset(path, width: 40, height: 40, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _avatar(friendAvatarPath),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xff006D84),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
