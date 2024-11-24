import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Book Appointment.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {



  @override

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:AnimatedSplashScreen(
            duration: 3000,
            splash: Image(image: AssetImage("assets/logo.png")),
            splashIconSize:300,
            nextScreen:screen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor:Color(0xff074063),
      
          )
      ),
    );

  }
}