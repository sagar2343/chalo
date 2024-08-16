import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Center(
                child: Image(
                  image: AssetImage('assets/chaloLogo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
