


import 'package:chat_app/styles/constant_styles.dart';
import 'package:chat_app/widgets/custom_text_field_widget.dart';
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

          //Email Vala Box
          CustomTextField(hintText: "Email", isPassword: false, icon:Icons.email),


        ],
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         obscureText: true,
    
//         decoration: InputDecoration(
//           suffixIcon: Icon(Icons.visibility),
//           prefixIcon: Icon(Icons.email,color: Colors.amber,),
    
//           hintText: "Email",
    
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))
//           ),
    
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colors.blue ,width: 2),
//           ),
    
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.red,width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }