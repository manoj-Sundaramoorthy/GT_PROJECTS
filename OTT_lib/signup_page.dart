import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otts/homepage.dart';
import 'function.dart';
import 'package:otts/login.dart';



class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {










  final validin = GlobalKey<FormState>();
  bool show = false;
  TextEditingController username = TextEditingController();
  TextEditingController Useremail = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  bool textVisible = true;
  bool textVisible1 = true;


  vj()
  {
    setState(() {
      username.text.isNotEmpty && Useremail.text.isNotEmpty && pass.text.isNotEmpty && cpass.text.isNotEmpty ? show=true :show=false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Form(
        key: validin,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right:30),
            child: Container(
              height: 750,
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 190),
                    child: Text("Sign Up",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    controller: username,
                    onChanged: (username){
                      vj();
                    },
                    validator: (username)
                    {
                      if(username!.isEmpty||RegExp('r^[A-Z]').hasMatch(username))
                      {
                        return"Enter valid Username";
                      }
                    },
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: Icon(Icons.person,color: Colors.red,size:20,),
                      hintText: "Enter User Name",
                    ),
                  ),



                  TextFormField(
                    controller: Useremail,
                    onChanged: (Useremail){
                      vj();
                    },
                    validator: (Useremail)
                    {
                      if(Useremail!.isEmpty||RegExp('r^[A-Z]').hasMatch(Useremail))
                      {
                        return"Enter valid Email";
                      }
                    },
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: Icon(Icons.email,color: Colors.red,size:20,),
                      hintText: "Enter email",
                    ),
                  ),



                  TextFormField(
                    controller: pass,
                    obscureText:textVisible,
                    validator: (password)
                    {
                      if(password ==null|| password.length<6)
                      {
                        return"Enter valid password";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          textVisible = ! textVisible;
                        });
                      },
                          icon:textVisible ?
                          Icon(Icons.visibility ,color: Colors.red,)
                              :Icon(Icons.visibility_off ,color: Colors.red,) ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: Icon(Icons.password,color: Colors.red,size:20,),
                      hintText: "Enter Password",
                    ),
                  ),


                  TextFormField(
                    controller: cpass,
                    obscureText: textVisible1,
                    validator: (password)
                    {
                      if(password ==null|| password.length<6)
                      {
                        return"Enter valid password";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          textVisible1 = ! textVisible1;
                        });
                      },
                          icon:textVisible1 ?
                          Icon(Icons.visibility ,color: Colors.red,)
                              :Icon(Icons.visibility_off ,color: Colors.red,) ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: Icon(Icons.password,color: Colors.red,size:20,),
                      hintText: "Conform Password",
                    ),
                  ),

                  //Sign Up-BTN
                  Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(onPressed: (){

                      if(validin.currentState!.validate())
                      {
                        AuthServices().registerWithEmailPassword(
                            Useremail.text.trim(),pass.text.trim()).then((value) {
                          print("Created New Account");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => homepage()));
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signin")));
                      }

                    },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.login_outlined,color: Colors.red,),
                          Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red),),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white38
                      ),
                    ),
                  ),


                  GestureDetector(
                    // onTap: () => AuthServices().signInWithGoogle(
                    // ).then((value) {
                    //   print("Created New Account");
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => homepage()));
                    // }),
                    onTap: () async {
                      final User? user = await AuthServices().signInWithGoogle();
                      if (user != null) {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => homepage()));
                      }
                    },

                      child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/google.png",
                        // width: 25,
                        height: 30,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 100,
                  ),



                  //GOOGLE SIGNIN BTN
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20,left: 20),
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.white38,
                  //       ),
                  //
                  //
                  //     onPressed: ()  {
                  //         AuthServices().signInWithGoogle().then((value) {
                  //           print("Created New Account");
                  //           Navigator.push(context,
                  //               MaterialPageRoute(builder: (context) => homepage()));
                  //         });
                  //       },
                  //
                  //
                  //       //   () async {
                  //       //   FirebaseAuth auth = await FirebaseAuth.instance;
                  //       //   try {
                  //       //     final GoogleSignInAccount? googleSignInAccount =
                  //       //     await GoogleSignIn(
                  //       //       clientId: '625904112381-d53h3m37vp3q198b76ulljeqjn9drduv.apps.googleusercontent.com',
                  //       //
                  //       //     ).signIn();
                  //       //     final GoogleSignInAuthentication
                  //       //     googleSignInAuthentication =
                  //       //     await googleSignInAccount!.authentication;
                  //       //
                  //       //     final AuthCredential credential =
                  //       //     GoogleAuthProvider.credential(
                  //       //       accessToken:
                  //       //       googleSignInAuthentication.accessToken,
                  //       //       idToken: googleSignInAuthentication.idToken,
                  //       //     );
                  //       //     auth.signInWithCredential(credential);
                  //       //     Navigator.push(
                  //       //         context,
                  //       //         MaterialPageRoute(
                  //       //             builder: (context) => homepage()));
                  //       //
                  //       //     // Use the user object for further operations or navigate to a new screen.
                  //       //   } catch (e) {
                  //       //     // print(e.toString());
                  //       //     Text("${e.toString()}");
                  //       //   }
                  //       // },
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 15,bottom: 15),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Container(height: 30,width: 30,
                  //               decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                   image: AssetImage("assets/google.png",),
                  //                   fit: BoxFit.fill,
                  //
                  //                 ),borderRadius: BorderRadius.circular(20),
                  //               ),
                  //             ),
                  //             Text("Sign in with Google",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
                  //           ],
                  //         ),
                  //       )),
                  // ),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Alredy have an account?",style: TextStyle(fontSize: 20,color: Colors.red),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> login(),),);
                      }, child:Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20),),),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}