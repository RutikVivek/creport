import 'package:flutter/material.dart';
import 'package:portfolio/ui/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
