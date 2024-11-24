import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'doctor application.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool invisible = true;



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width * 0.05; // General padding ratio
    double containerWidth = width * 0.9;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                Center(
                  child: Container(
                    height: height * 0.4,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/lock.jpg"),)),
                  ),
                ),
                SizedBox(height: padding),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7f7fef)),
                ),
                SizedBox(height: padding / 2),
                Shimmer.fromColors(
                  baseColor: Colors.black54,
                  highlightColor: Colors.black12,
                  child: Text(
                    "Sign in to Book a doctor's",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
      
                Shimmer.fromColors(
                  baseColor: Colors.black54,
                  highlightColor: Colors.black12,
                  child: Text(
                    'Appointment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
      
                SizedBox(height: padding),
      
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: TextFormField(
                    controller: email,

                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: padding),
      
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: TextFormField(
                    controller: password,

                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                              .hasMatch(value)) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                    obscureText: true, // Hides the password text
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: padding), // Space between fields
      
                Visibility(
                  visible: invisible,
                  child: Container(
                    height: height * 0.07,
                    width: containerWidth,
                    decoration: BoxDecoration(
                        color: Color(0xFF7f7fef),
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7f7fef)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Signing In")),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Example()),
                          );
                        }
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding), // Space before next section
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Don't have an account?",
                      style: TextStyle(
                          fontSize: width * 0.04, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xFF7f7fef),
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
