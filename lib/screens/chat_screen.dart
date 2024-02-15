import 'dart:developer';

import 'package:chat_app/extensions/build_context_extensions.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/styles/constant_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final textMessagingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 10,
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

          


          Spacer(),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10 , left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: context.getWidth(percent: 0.8),
                    child: TextField(
                      controller: textMessagingController,
                      decoration: InputDecoration(
                        hintText: "message",
                        fillColor: Colors.white,filled: true
                      ),
                    )),
              
                  IconButton(onPressed: (){
                      sendMessage();
                  }, icon: const Icon(Icons.send,color: Colors.white,))
                ],
              ),
            ),
          ),
        ],
      ),
      
    );

  }

  Future<void> sendMessage()  async{
    
    if (textMessagingController.text.isNotEmpty){

      final message= {
        'message':textMessagingController.text,
        "senderUID" : FirebaseAuth.instance.currentUser!.uid,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      
      await FirebaseFirestore.instance.collection('messages').add(message)
      .then((value){
        textMessagingController.clear();
        log(value.toString());
      });

    }
  }


// database se messages fetch krna
  void getMessage() {


     FirebaseFirestore.instance.collection('messages')
    .snapshots()
    .listen((event) {
      
    });
  }
}