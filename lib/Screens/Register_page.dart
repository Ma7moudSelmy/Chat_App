import 'package:chat_app/Screens/chat_app.dart';
import 'package:chat_app/Screens/login_page.dart';
import 'package:chat_app/Widgets/constfile.dart';
import 'package:chat_app/Widgets/custom_Text_Field.dart';
import 'package:chat_app/Widgets/cutom_Button.dart';
import 'package:chat_app/helper/ShowSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static get id => "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const SizedBox(height: 100),
                Image.asset("assets/images/scholar.png", height: 100),
                const SizedBox(height: 20),

                const Center(
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
                const SizedBox(height: 50),

                const Row(
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
                const SizedBox(height: 20),

                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hinttext: "Email",
                ),
                const SizedBox(height: 15),

                CustomFormTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hinttext: "Password",
                ),
                const SizedBox(height: 20),

                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );

                        ShowSnackBar(context, "Success");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatApp(),
                          ),
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          ShowSnackBar(context, "Weak password");
                        } else if (ex.code == 'email-already-in-use') {
                          ShowSnackBar(context, "Email already exists");
                        }
                      } catch (ex) {
                        ShowSnackBar(context, "There was an error");
                      }
                      isloading = false;
                      setState(() {});
                    } else {
                      ShowSnackBar(context, "Not valid");
                    }
                  },
                  text: "Register",
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?  ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
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
