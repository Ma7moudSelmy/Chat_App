import 'package:chat_app/Screens/Register_page.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:chat_app/Widgets/custom_Text_Field.dart';
import 'package:chat_app/Widgets/cutom_Button.dart';
import 'package:chat_app/helper/ShowSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String? email;

String? password;

bool isloading = false;

GlobalKey<FormState> formkey = GlobalKey();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: KprimaryColor,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,

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

                custom_Form_Text_Field(
                  hinttext: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(height: 15),

                custom_Form_Text_Field(
                  hinttext: "password",
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(height: 20),

                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user_not found') {
                          ShowSnackBar(context, "user_not found");
                        } else if (ex.code == 'Wrong_password') {
                          ShowSnackBar(context, "Wrong_password");
                        }
                      } catch (ex) {
                        ShowSnackBar(context, "There was an error");
                      }
                      isloading = false;
                      setState(() {});

                      ShowSnackBar(context, "success");
                    } else {
                      ShowSnackBar(context, "not valid");
                    }
                  },

                  text: "Login",
                ),
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
                          MaterialPageRoute(
                            builder: (context) => Registerpage(),
                          ),
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
        ),
      ),
    );
  }
}
