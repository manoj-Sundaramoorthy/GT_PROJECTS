import 'package:flutter/material.dart';

class post_one extends StatefulWidget {
  const post_one({super.key});

  @override
  State<post_one> createState() => _post_oneState();
}

class _post_oneState extends State<post_one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          height: 500,
          width: 400,
          child: ListView.builder(
            // itemCount: ,
              itemBuilder: (BuildContext context ,int index){

          }),
        ),
      ),
    );
  }
}
