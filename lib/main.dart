import 'package:chalo/screens/home_screen.dart';
import 'package:chalo/screens/splash_screen.dart';
import 'package:chalo/screens/transaction/screen/transaction_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Chalo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
