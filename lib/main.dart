import 'package:flutter/material.dart';
import 'package:islami_tassk/sebha_tap/sebha.dart';
import 'package:islami_tassk/splash/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Facebook",
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName :( _)=>SplashScreen(),
        SebhaScreen.routeName :( _)=>SebhaScreen(),



      }
      ,
    );
  }
}
