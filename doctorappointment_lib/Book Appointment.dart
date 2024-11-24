
import 'package:DoctorAppointment/signin%20page.dart';
import 'package:flutter/material.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  width: 380,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage("assets/signin.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Book Appointment",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7f7fef)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Book Doctor's Appointment For",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                "the parents",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xFF7f7fef),
                    //border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7f7fef)),
                  onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Signinpage()));
                  },
                  child: Text("Get Started",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}