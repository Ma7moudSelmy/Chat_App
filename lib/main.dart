import 'package:chat_app/Screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(chat_app());
}

class chat_app extends StatelessWidget {
  const chat_app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
