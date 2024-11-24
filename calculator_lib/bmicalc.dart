import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;
  String value="";
  Color clr=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Center(child: Text("BMI CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      ),

      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top:30,bottom: 20,left: 20,right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: a,
                style: TextStyle(fontSize: 25,color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter Height(in cm)",
                  border: OutlineInputBorder(),

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: b,
                style: TextStyle(fontSize: 25,color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter Body Weight",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.purple.shade300,
              borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(onPressed: (){

                setState(() {
                  height = double.parse(a.text);
                  weight = double.parse(b.text);
                  height = (height * 0.01);
                  bmi = weight/(height*height);
                  if(bmi<=18.4){
                    setState(() {
                      clr=Colors.yellowAccent;
                      value="Under Weight";
                    });
                  }else if(bmi<=24.9){
                    setState(() {
                      clr=Colors.green.shade600;
                      value="Normal";
                    });
                  }else if(bmi<=39.9){
                    setState(() {
                      clr=Colors.orange.shade600;
                      value="Over Weight";
                    });
                  }else if(bmi>40.0){
                    setState(() {
                      clr=Colors.red;
                      value="Obese";
                    });
                  }



                  showDialog(

                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: clr,
                      title:  Text("BMI RESULT:"),
                      content:  Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${bmi.toString()}",style: TextStyle(fontSize: 20),),
                          Text(value,style: TextStyle(fontSize: 20),),

                          //Float chat
                          Padding(
                            padding: const EdgeInsets.only(top:40),
                            child: Container(
                              height:120,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border:Border.all(),
                              ),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Container(
                                    color: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("BMI",style: TextStyle(fontSize: 20,color: Colors.black),),
                                        Text("Status",style: TextStyle(fontSize:20,color: Colors.black),),
                                      ],
                                    ),
                                  ),

                                  //ud
                                  Container(
                                    color: Colors.yellow,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("below 18.4",style: TextStyle(fontSize: 15,color: Colors.black),),
                                        Text("Under Weight",style: TextStyle(fontSize: 15,color: Colors.black),),
                                      ],
                                    ),
                                  ),

                                  //nl
                                  Container(
                                    color: Colors.green.shade400,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("18.5-24.9",style: TextStyle(fontSize: 15,color: Colors.black),),
                                        Text("Normal",style: TextStyle(fontSize: 15,color: Colors.black),),
                                      ],
                                    ),
                                  ),

                                  //Ow
                                  Container(
                                    color: Colors.orange.shade600,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("25.0-39.9",style: TextStyle(fontSize: 15,color: Colors.black),),
                                        Text("Over Weight",style: TextStyle(fontSize: 15,color: Colors.black),),
                                      ],
                                    ),
                                  ),

                                  //os
                                  Container(
                                    color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("40.0 Above",style: TextStyle(fontSize: 15,color: Colors.black),),
                                        Text("Obese",style: TextStyle(fontSize: 15,color: Colors.black),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.all(14),
                            child: const Text("Okay",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),

                        ),
                      ],
                    ),

                  );


                });

              },
                child: Text("CALCULATE",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),

            ),





          ],
        ),
      ),



    );
  }
}
