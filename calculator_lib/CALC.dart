import 'dart:math';

import 'package:flutter/material.dart';


class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String val1 = "", val2 = "";
  String optr = "";
  bool clk = false;


  TextEditingController ctrl = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Center(child: Text("CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height:100,
              width: 400,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 10),
                child: TextFormField(

                  controller: ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 40,color: Colors.white),
                ),
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: (){
                        ctrl.text="";
                        val1 = "";
                        val2 = "";
                        optr = "";
                        clk=false;
                      },
                      child: Text(
                        "AC",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          String str = ctrl.text;
                          String result =str.substring(0,str.length -1 );
                          ctrl.text=result;
                        });
                      },
                      child:Icon(Icons.backspace_outlined,size: 30,color: Colors.white,)
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                       double value=double.parse(val1);
                       double ans=value/100;
                       ctrl.text=ans.toString();
                       val1=ctrl.text;
                       clk=true;
                      },
                      child: Text("%",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        ctrl.text = "/";
                        optr = "/";
                        clk = true;
                      },
                      child: Text("/",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      )),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "7";
                          ctrl.text = val2;
                        } else {
                          val1 += "7";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "8";
                          ctrl.text = val2;
                        } else {
                          val1 += "8";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "9";
                          ctrl.text = val2;
                        } else {
                          val1 += "9";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "9",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        ctrl.text = "*";
                        optr = "*";
                        clk = true;
                      },
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "4";
                          ctrl.text = val2;
                        } else {
                          val1 += "4";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "5";
                          ctrl.text = val2;
                        } else {
                          val1 += "5";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "6";
                          ctrl.text = val2;
                        } else {
                          val1 += "6";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        ctrl.text = "-";
                        optr = "-";
                        clk = true;
                      },
                      child: Text(
                        " - ",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "1";
                          ctrl.text = val2;
                        } else {
                          val1 += "1";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "2";
                          ctrl.text = val2;
                        } else {
                          val1 += "2";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "3";
                          ctrl.text = val2;
                        } else {
                          val1 += "3";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        ctrl.text = "+";
                        optr = "+";
                        clk = true;
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        double valuesq = double.parse(val1);
                        double anssq =  sqrt(valuesq);
                        ctrl.text = anssq.toString();
                        val1 = ctrl.text;
                        clk = true;


                      },
                      child: Text(
                        "√",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += "0";
                          ctrl.text = val2;
                        } else {
                          val1 += "0";
                          ctrl.text = val1;
                        }
                      },
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        if (clk) {
                          val2 += ".";
                          ctrl.text = val2;
                        } else {
                          val1 += ".";
                          ctrl.text = val1;
                        }
                        ;
                      },
                      child: Text(
                        ".",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(onPressed: ()
                  {
                    double a=double.parse(val1);
                    double b=double.parse(val2);
                    double c=0;
                    if(optr=="+"){
                      c=a+b;
                    }
                    else if(optr=="-"){
                      c=a-b;
                    }
                    else if(optr=="*"){
                      c=a*b;
                    }
                    else if(optr=="/"){
                      c=a/b;
                    }

                    ctrl.text=c.toString();
                    val1=ctrl.text;
                    val2="";

                  },
                      child: Text("=",style: TextStyle(fontSize: 50,color: Colors.white),
                      )
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(

                      onPressed: () {
                        double value = double.parse(val1);
                        double ans = value * value;
                        ctrl.text = ans.toString();
                        val1 = ctrl.text;
                        clk = true;
                      },
                      child: Text(
                        "^",
                        style: TextStyle(fontSize: 40,color: Colors.white),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          {
                            double plus=double.parse(val1);
                            double value =0;
                            if(plus.isNegative){
                              value=plus.abs();
                            }
                            else{
                              value=plus*-1;
                            }
                            val1=value.toString();
                            ctrl.text=val1;
                          };
                        });
                      },
                      child: Text(
                        "+/-",
                        style: TextStyle(fontSize: 50,color: Colors.white),
                      )),
                ),


              ],
            ),
          ],
        ),
      ),



    );
  }
}
