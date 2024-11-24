import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'main.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [


          Container(
            height: double.infinity,
            width: 300,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
