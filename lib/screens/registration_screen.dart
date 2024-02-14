


import 'dart:developer';

import 'package:chat_app/extensions/build_context_extensions.dart';
import 'package:chat_app/widgets/custom_text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({super.key});

  final nameController= TextEditingController();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            
              CustomTextField(hintText: "Email", isPassword: false, icon: Icons.mail, controller: emailController,),
              CustomTextField(hintText: "Full Name", isPassword: false, icon: Icons.mail,controller: nameController),
              CustomTextField(hintText: "Password", isPassword: true, icon: Icons.mail,controller: passwordController),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  registerNewUser();
                },
                 child: Text("Register Now")
                                
                                ),
              ),
        
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text("Already an user? Go to Login")
                ),
          ],
        ),
      ),
    );
  }
  // Future<void> registerNewUser(String email , String password) async{
  Future<void> registerNewUser() async{

    final email = emailController.text;
    final password=passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty){

     await  FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: email , password: password)
      .then((value){
        // iss syntax ka mtlb hai 
        log(value.user!.uid);
      });
    }
  }

  Future<void> addDataToDatabase() async{

    await FirebaseFirestore.instance.collection('users').add(data);
  }
}