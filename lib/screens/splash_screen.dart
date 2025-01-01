// /*import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:newapp/screens/home.dart';
// import 'package:newapp/screens/log.dart';
// import 'package:newapp/screens/register.dart';
// // import 'package : doctor_app/Screens/Sign_in_screen.dart';
//
// class Open extends StatefulWidget {
//   @override
//      _OpenState createState() => _OpenState();
//
// }
//
// class _OpenState extends State<Open> {
//   @override
//   void initState() {
//       super.initState();
//
//       Future.delayed(Duration(seconds: 2), () {
//
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => log()),
//
//         );
//       });
//   }
//
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//             // App logo or name can be displayed here
//         Text(
//           'Medi Care',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//   ),//TextStyle
//         ),//Text
//         SizedBox(height: 20),
//         CircularProgressIndicator(), //Lording indicator
//         ],
//       ),
//     ),
//   );
//
// }
// }
//
// class PlaceholderSignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: Text('Placeholder Sign In Screen'),
//       ),
//     );
//   }
// }*/
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'package:sqlite_flutter_crud/screens/signin_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//         () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const SigninScreen(),
//             )));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 30),
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//           Colors.lightBlueAccent,
//           Color.fromARGB(255, 60, 160, 242),
//           Colors.white
//         ])),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'lib/assets/login.png',
//               height: 30,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sqlite_flutter_crud/Authtentication/login.dart' as Login;
// import 'package:sqlite_flutter_crud/screens/login.dart';
// import 'package:sqlite_flutter_crud/screens/signin_screen.dart';
//
// import '../Authtentication/login.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       const Duration(seconds: 5),
//           () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//            builder: (context) => const Login.LoginScreen(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'lib/assets/logoB.png',
//               height: 300, // Adjust the height as needed
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const CircularProgressIndicator(), // Loading indicator
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/Authtentication/login.dart';
import 'package:sqlite_flutter_crud/screens/register_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          // builder: (context) =>   HomePage(),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logoB.png',
              height: 170,
            ),

            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(), // Loading indicator
          ],
        ),
      ),
    );
  }
}
