import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otts/forgetpass.dart';
import 'package:otts/function.dart';
import 'package:otts/homepage.dart';
import 'package:otts/signup_page.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final valid = GlobalKey<FormState>();
  bool show = false;
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  bool textVisible = true;

  vj() {
    setState(() {
      a.text.isNotEmpty && b.text.isNotEmpty ? show = true : show = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [ Container(
                height: 420,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/homelander.webp"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 320),
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {}, child: Text("Skip", style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white,),),),
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: valid,
              child: Container(
                width: double.infinity,
                height: 550,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 190),
                      child: Text("Login   ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red),
                      ),
                    ),


                    //email text formfield
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: TextFormField(
                        controller: a,
                        onChanged: (a) {
                          vj();
                        },
                        validator: (email) {
                          if (email!.isEmpty || RegExp('r^[A-Z]').hasMatch(
                              email)) {
                            return "Enter valid Email";
                          }
                        },
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.red, size: 20,),
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter email',
                        ),
                      ),
                    ),


                    //password text formfield
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: TextFormField(
                        controller: b,
                        obscureText: textVisible,
                        validator: (password) {
                          if (password == null || password.length < 6) {
                            return "Enter valid password";
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              textVisible = !textVisible;
                            });
                          }, icon: textVisible ?
                          Icon(Icons.visibility, color: Colors.red,)
                              : Icon(Icons.visibility_off, color: Colors.red,)
                          ),
                          icon: Icon(Icons.password, size: 20,
                              color: Colors.red),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),

                          hintText: 'Enter Password',
                        ),

                      ),
                    ),


                    //Signin
                    Container(
                      height: 60,
                      width: 200,
                      child: ElevatedButton(onPressed: () {
                        if (valid.currentState!.validate()) {
                         // AuthServices().signInWithEmailPassword(a.text, b.text)
                         //      .then((value) {
                         //    Navigator.push(context,
                         //        MaterialPageRoute(
                         //            builder: (context) => homepage()));
                         //  });
                         //  ScaffoldMessenger.of(context).showSnackBar(
                         //      SnackBar(content: Text("Login")));
                        }
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.login_outlined, color: Colors.red,),
                            Text("Login", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.red),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white38
                        ),
                      ),
                    ),

                    TextButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (Context) => forget()),
                      );
                    },
                      child: Text("Forget Password ?", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20),),),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: TextStyle(fontSize: 20, color: Colors.red),),
                        TextButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (Context) => signup())
                          );
                        },
                          child: Text("Sign Up", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),),),
                      ],
                    ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


