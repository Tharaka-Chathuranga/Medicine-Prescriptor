// import 'package:flutter/material.dart';
//
// class SigninScreen extends StatelessWidget {
//   const SigninScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           padding: EdgeInsets.symmetric(vertical: 30),
//           width: double.infinity,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//             Colors.lightBlue,
//           ])),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Login",
//                       style: TextStyle(color: Colors.white, fontSize: 40),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Welcome Back",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Sign into your account",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(60),
//                           topRight: Radius.circular(60))),
//                   child: Padding(
//                     padding: EdgeInsets.all(30),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.blue,
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10))
//                               ]),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.blueGrey))),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                       hintText: "Email Or Phone number",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.blueGrey))),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                       hintText: "Password",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Forgot Password?",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(80),
//                               color: Colors.lightBlueAccent),
//                           child: Center(
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Create new account?",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         Text(
//                           "Sign Up",
//                           style:
//                               TextStyle(color: Color.fromARGB(255, 5, 86, 153)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
