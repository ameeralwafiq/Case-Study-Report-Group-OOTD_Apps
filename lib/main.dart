import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'navigation/bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OOTD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      
      initialRoute: '/login', // Start with the login screen
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => BottomNavigationBarExample(
          userName: 'User',
          userEmail: 'user@example.com',
          outfitCount: 10,
        ),
      },
    );
  }
}
