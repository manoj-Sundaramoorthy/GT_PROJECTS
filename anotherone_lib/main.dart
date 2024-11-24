import 'package:apianotherone/api.dart';
import 'package:apianotherone/api2.dart';
import 'package:apianotherone/cred/page1_1.dart';
import 'package:apianotherone/getapi.dart';
import 'package:flutter/material.dart';
import 'cred/diwakar/page1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: new ThemeData(

            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.black12,
            )
        ),
      debugShowCheckedModeBanner: false,
      home: page1_1()
    );
  }
}

