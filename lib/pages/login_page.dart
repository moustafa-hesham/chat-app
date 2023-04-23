import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/showSnackBar.dart';
import '../widgets/custom_button.dart';
import 'chat_Page.dart';

class LogInPage extends StatefulWidget {
  static String id = "LogInPage";
  LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/Chat logo.png',
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chito Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  securedText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userLogin();
                        showSnackBar(context, "Logged In Succussfully");
                        Navigator.pushNamed(
                          context,
                          ChatPage.id,
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, "No user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              "Wrong password provided for that user.");
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'SIGN IN',
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        '  Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
