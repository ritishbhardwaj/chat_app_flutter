import 'package:chat_app/extensions/build_context_extensions.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/styles/constant_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Chat Screen", style: titleTextStyle,),
        actions: [

          // adding logout Functionality
          
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              context.navigateToScreen(LoginScreen(),isReplace: true);
            });
          }, icon: const Icon(Icons.logout))
        ],
      ),

      body: Column(

        children: [
          ElevatedButton(
            onPressed: (){
                  // context.navigateToScreen(LoginScreen());
            }, 
            child: Text("Logout",style: titleTextStyle.copyWith(fontSize: 10),)
            )
        ],
      ),
      
    );

  }
}