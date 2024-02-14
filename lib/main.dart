


import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{


  // YE line barhi important hai before continuing 
  //it ensures ki platform engine(on our local machine) chaalu ho chuka hai   like ios ka ios platform se and android ka android vale se
  // so it is very important line
  //this firebase engine then connects to the firebase platform and ensure the flow
  
  WidgetsFlutterBinding.ensureInitialized();

  // This line is being added via copy pasting from firebase site
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
      home: LoginScreen(),
    );
  }
}