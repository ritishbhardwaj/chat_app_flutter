


import 'package:chat_app/styles/constant_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login", style:titleTextStyle,),
          TextFormField(), 
        ],
      ),
    );
  }
}