import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart'; 
import 'screens/Signup_Start.dart';
import 'screens/signup_complete_screen.dart'; 
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/chat_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', 
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signupStart': (context) => const SignupStartScreen(),
        '/signupComplete': (context) => const SignupCompleteScreen(),
        '/home': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),     
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
