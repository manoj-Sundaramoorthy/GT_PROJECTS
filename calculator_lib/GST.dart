import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class GST extends StatefulWidget {
  const GST({super.key});

  @override
  State<GST> createState() => _GSTState();
}

class _GSTState extends State<GST> {
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  double gstamount=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Center(child: Text("GST CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      ),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top:30,bottom: 20,left: 20,right: 20),
              child: TextFormField(
                controller: a,
              style: TextStyle(fontSize: 25,color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter amount",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
              child: TextFormField(
                controller: b,
                style: TextStyle(fontSize: 25,color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter percentage",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),



          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 60,
              width:250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.purple.shade300,
              ),
              child: TextButton(onPressed: (){
                setState(() {
                  double x=double.parse(a.text);
                  double y=double.parse(b.text);
                  gstamount=x-(x/(1+(y/100)));
                  double z = (x-gstamount) ;


                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title:  Text("Inclusive"),
                      content:  Column(
                        children: [
                          Text("Actual Amount:${z.toString()}",style: TextStyle(fontSize: 20),),
                          Text("GST :${gstamount.toString()}",style: TextStyle(fontSize: 20),),
                          Text("Given Amount:${x.toString()}",style: TextStyle(fontSize: 20),)


                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            color: Colors.green,
                            padding: const EdgeInsets.all(14),
                            child: const Text("okay"),
                          ),
                        ),
                      ],
                    ),
                  );
                });


              }, child: Text("INCLUSIVE",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
            ),
          ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 60,
                width:250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.purple.shade300,
                ),
                child: TextButton(onPressed: (){
                  setState(() {
                    double x=double.parse(a.text);
                    double y=double.parse(b.text);
                    gstamount = (y/100)*x;
                    double z = (x+gstamount) ;


                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title:  Text("Exclusive"),
                        content:  Column(
                          children: [
                            Text("Actual Amount:${z.toString()}",style: TextStyle(fontSize: 20),),
                            Text("GST :${gstamount.toString()}",style: TextStyle(fontSize: 20),),
                            Text("Given Amount:${x.toString()}",style: TextStyle(fontSize: 20),)


                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              color: Colors.green,
                              padding: const EdgeInsets.all(14),
                              child: const Text("okay"),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                }, child: Text("EXCLUSIVE",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
