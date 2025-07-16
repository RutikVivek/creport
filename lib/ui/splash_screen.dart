import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/homepage.dart';
import 'package:portfolio/ui/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      navigateToScreens();
    });
  }

  void navigateToScreens() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final email = sharedPreferences.getString('email');

    if (email == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
