import 'package:chat_app/Screens/Register_page.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:chat_app/Widgets/custom_Text_Field.dart';
import 'package:chat_app/Widgets/cutom_Button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  "login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            custom_Text_Field(hinttext: "Email", onChanged: (value) {}),
            SizedBox(height: 15),

            custom_Text_Field(hinttext: "password", onChanged: (value) {}),
            SizedBox(height: 20),

            CustomButton(text: "Login"),
            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "dont't have an account?  ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registerpage()),
                    );
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
