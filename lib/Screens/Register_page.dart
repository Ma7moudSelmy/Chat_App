import 'dart:math';

import 'package:chat_app/Screens/login_page.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:chat_app/Widgets/custom_Text_Field.dart';
import 'package:chat_app/Widgets/cutom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key});
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/scholar.png", height: 100),
            SizedBox(height: 20),

            Center(
              child: Text(
                "Scholar Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            SizedBox(height: 50),

            Row(
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            custom_Text_Field(
              onChanged: (data) {
                email = data;
              },

              hinttext: "Email",
            ),
            SizedBox(height: 15),

            custom_Text_Field(
              onChanged: (data) {
                password = data;
              },

              hinttext: "password",
            ),
            SizedBox(height: 20),

            CustomButton(
              onTap: () async {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                } on FirebaseAuthException catch (ex) {
                  if (ex.code == 'weak-password') {
                    ShowSnackBar(context, "weak password");
                  } else if (ex.code == 'email-already-in-use') {
                    ShowSnackBar(context, "email already exists");
                  }
                }
                ShowSnackBar(context, "success");
              },

              text: "Register",
            ),
            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?  ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("login", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void ShowSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
