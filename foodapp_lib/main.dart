import 'package:flutter/material.dart';
import 'package:foodapp/page1.dart';
import 'package:foodapp/page2.dart';
import 'package:foodapp/page3.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Flutter Demo',
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.white54,

        appBarTheme: AppBarTheme(
          iconTheme:IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          color: Colors.transparent,
        ),

        iconTheme: IconThemeData(
            color: Colors.white,
            size: 35,
        ),

        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize:40,

            fontFamily:"GoogleFonts.acme",
          ),
          headlineLarge: TextStyle(
              fontSize:30,
            fontFamily:"GoogleFonts.acme",
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: "GoogleFonts.acme",
            fontSize:18,
            fontWeight: FontWeight.bold,
            color: Colors.black26
          )
        )

      ),
      home: page2()
    );
  }
}

