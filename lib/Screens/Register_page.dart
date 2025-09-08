import 'package:chat_app/Screens/login_page.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:chat_app/Widgets/custom_Text_Field.dart';
import 'package:chat_app/Widgets/cutom_Button.dart';
import 'package:chat_app/helper/ShowSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

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

                custom_Form_Text_Field(
                  onChanged: (data) {
                    email = data;
                  },

                  hinttext: "Email",
                ),
                SizedBox(height: 15),

                custom_Form_Text_Field(
                  onChanged: (data) {
                    password = data;
                  },

                  hinttext: "password",
                ),
                SizedBox(height: 20),

                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "login",
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
