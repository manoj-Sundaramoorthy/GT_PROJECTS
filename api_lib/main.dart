import 'package:api/coin_desk/coin_test.dart';
import 'package:api/postapi/task1.dart';
import 'package:flutter/material.dart';
import 'cat_api/test.dart';
import 'listapi/task1.dart';
import 'nationalize/nationalize_test.dart';

void main() {
  runApp(const MyApp());
}
//nationalize
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home:jsonlist_api(),
    );
  }
}