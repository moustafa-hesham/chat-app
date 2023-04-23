import 'package:chat_app/pages/chat_Page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LogInPage.id: (context) => LogInPage(),
        ChatPage.id: (context) => ChatPage(),
        RegisterPage.id: (context) => RegisterPage()
      },
      initialRoute: LogInPage.id,
    );
  }
}
