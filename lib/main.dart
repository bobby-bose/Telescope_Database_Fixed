import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:telescope/pages/homecgpt.dart';
import 'package:telescope/pages/scheduler.dart';
import 'package:telescope/pages/LearningCorner.dart';
import 'package:telescope/pages/iss.dart';
import 'package:telescope/pages/login.dart';
import 'package:telescope/pages/signup.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'firebase_options.dart'; // testing code for flutterfire

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyAJCtS5hyNMaDVi4al5u8fZQSM2F_yIdDs",
      //   appId: "1:901109232488:android:099c55898dfd8b60081cdd",
      //   messagingSenderId: "901109232488",
      //   projectId: "astro-align",
      //   // Your web Firebase config options
      // ),
    ); // CLOSING OF THE INITIALIZE CALLflutt
    /*else {
      await Firebase.initializeApp();
    }*/
  } catch (e) {
    print("Error initializing Firebase: $e");
    // Optionally, you can handle the error more gracefully, e.g., showing an error message to the user.
  }
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Set androidProvider to `AndroidProvider.debug`
    androidProvider: AndroidProvider.debug,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/scheduler': (context) => const SchedulerPage(),
        '/learningCorner': (context) => const LearningCornerPage(),
        '/iss': (context) => MapScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
