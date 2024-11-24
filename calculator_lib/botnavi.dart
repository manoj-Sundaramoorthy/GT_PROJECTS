import 'package:flutter/material.dart';
import 'CALC.dart';
import 'GST.dart';
import 'bmicalc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;

  final screens = [
    calculator(),
    GST(),
    bmi(),
  ];

  void tap(index)
  {
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple.shade300,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined,size: 30,color: Colors.black,),label: "Calculator",),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money,size: 30,color: Colors.black,),label: "GST Calculator",),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,color: Colors.black,),label: "BMI Calculator"),
          ],
          currentIndex: _index,
          onTap: tap,

        )
    );
  }
}