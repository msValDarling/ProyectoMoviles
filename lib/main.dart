import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cakecraft/screens/LoginScreen.dart';
import 'package:cakecraft/screens/Onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CakeCraft!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'G low kitty!',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/5.png',
      nextScreen: Onboarding(),
      backgroundColor: Colors.pink.shade100,
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: Duration(seconds: 3),
    );
  }
}
