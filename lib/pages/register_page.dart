import 'package:chat_app/pages/chat_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/showSnackBar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      'Sign Up',
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
                        await userRegistration();
                        showSnackBar(context, "Account Created!");
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, "Password is too weak!");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, "Email is already exists!");
                        }
                      } catch (e) {
                        showSnackBar(context, 'There was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'REGISTER',
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Sign In',
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
    ;
  }

  Future<void> userRegistration() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
