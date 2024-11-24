import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otts/Farzi.dart';
import 'package:otts/citadel.dart';
import 'package:otts/devilshours.dart';
import 'package:otts/diabolical.dart';
import 'package:otts/english.dart';
import 'package:otts/genv.dart';
import 'package:otts/hindi.dart';
import 'package:otts/kannada.dart';
import 'package:otts/malayalam.dart';
import 'package:otts/movieinenglish.dart';
import 'package:otts/peaky.dart';
import 'package:otts/spllash%20screen.dart';
import 'package:otts/login.dart';
import 'package:otts/homepage.dart';
import 'package:otts/tamil.dart';
import 'package:otts/telugu.dart';
import 'package:otts/videos_dis_wolverin.dart';
import 'package:otts/videos_dis_goat.dart';
import 'package:otts/videos_dis_the boys.dart';
import 'package:otts/videos_dis_breaking bad.dart';
import 'package:otts/videos_dis_aavesham.dart';
import 'package:otts/videos_dis_kalki 2898 ad.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDWdziqrSHYb34TVuOt20kDHV2F-eSKMfc",
          authDomain: "projectott-6466b.firebaseapp.com",
          projectId: "projectott-6466b",
          storageBucket: "projectott-6466b.appspot.com",
          messagingSenderId: "978419317696",
          appId: "1:978419317696:web:a3181ede24505296ef2625",
          measurementId: "G-5EYZZFWLFZ",

      )
  );
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:splash(),
    );
  }
}


