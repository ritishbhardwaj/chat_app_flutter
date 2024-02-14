


import 'package:chat_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
            CustomTextField(hintText: "Email", isPassword: false, icon: Icons.mail),
            CustomTextField(hintText: "Full Name", isPassword: false, icon: Icons.mail),
            CustomTextField(hintText: "Password", isPassword: true, icon: Icons.mail),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text("Already an user? Go to Login")
              ),
        ],
      ),
    );
  }
}