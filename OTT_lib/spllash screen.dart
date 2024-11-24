import 'dart:async';
import 'package:flutter/material.dart';

import 'login.dart';



class splash extends StatefulWidget {

  @override
  _splashState createState() => _splashState();

}
class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => login()
                )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF000619),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage("assets/splash1.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),


                ],
              ),
            ),

           Padding(
              padding: const EdgeInsets.only(top: 200),
              child: CircularProgressIndicator(
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          ],

        ),


      ),
    );
  }
}

