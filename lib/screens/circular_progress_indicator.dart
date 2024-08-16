import 'package:chalo/color.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorScreen extends StatelessWidget {
  const CircularProgressIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.secondaryColor),
      ),
    );
  }
}
