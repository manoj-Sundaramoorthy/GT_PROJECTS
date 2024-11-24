import 'package:flutter/material.dart';
import 'package:otts/main.dart';


class crl_img1 extends StatefulWidget {
  const crl_img1({super.key, required imagePath});

  @override
  State<crl_img1> createState() => _crl_img1State();
}

class _crl_img1State extends State<crl_img1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: 100,
        width: 100,
        color: Colors.yellow,
      ),
    );
  }
}
