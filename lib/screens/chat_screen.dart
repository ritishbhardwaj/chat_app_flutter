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

      body: Stack(

        children: [

          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context,snapshot){
                if (snapshot.connectionState==ConnectionState.waiting){

                    return Center(
                      child: CircularProgressIndicator()
                      );

                }else if (snapshot.hasError){

                      return Center(child: Text("Fail to send Message"));

                }else if(snapshot.hasData) {
                  final messages = snapshot.data!.docs;  // this standard form to get data form firebase  [humne messages mei leliya messages]

                  return Positioned(
                    top: 0,
                        left: 0,
                        right: 0,
                        bottom: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text(messages[index]['message']),
                          subtitle: Text(messages[index]['email']),
                        );
                      }
                      ),
                  );
                }
                else{
                  return Center(child: Text("No Messages"));
                }
              },
          ),


          // Spacer(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,


            child: Container(
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
        'email' : FirebaseAuth.instance.currentUser!.email,
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
  // void getMessage() {


  //    FirebaseFirestore.instance.collection('messages')
  //   .snapshots()
  //   .listen((event) {
      
  //   });
  // }
}