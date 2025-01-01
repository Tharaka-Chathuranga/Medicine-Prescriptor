import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';

import 'package:sqlite_flutter_crud/Authtentication/login.dart';
import 'package:sqlite_flutter_crud/Authtentication/signup.dart';
import 'package:sqlite_flutter_crud/screens/history.dart';

import 'package:sqlite_flutter_crud/screens/splash_screen.dart';

void main()   {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'Named Routes Demo',

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/second': (context) => const LoginScreen(),
        '/third': (context) => const SignUp(),
        '/fourth': (context) =>const HomePage(),
       '/fifth': (context) => const PrescriptionHistory(title: 'Prescription History'),

      },
    ),
  );
}