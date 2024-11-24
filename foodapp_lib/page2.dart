import 'package:flutter/material.dart';
import 'package:foodapp/page1.dart';
import 'package:google_fonts/google_fonts.dart';


class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {


  List e=[
    "assets/fruitsalad.jpg",
    "assets/greensalad.png",
    "assets/bound.jpg",
    "assets/salad2.jpg",
  ];

  List f=[
    "Fruit Salad",
    "Green Salad",
    "Vegetables\nSalad",
    "Combination\nSalad",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: 275,
            color: Colors.redAccent,
          ),
          
          Column(
            children: [

              SizedBox(height: 50,),
              Container(
                height: 50,
                width: double.infinity,

                child: Padding(
                  padding: const EdgeInsets.only(right: 40,left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     IconButton(onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => page1()),
                       );                     }, icon:Icon(Icons.arrow_back_outlined))

                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text("Salads\nmenu",style: Theme.of(context).textTheme.displayLarge,),
              ),


              Container(
                height: 600,
                width: 350,
                child: ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: e.length,
                  itemBuilder: (Context,index){
                    return Stack(

                      children:[

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 120,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black12
                                  )
                              ),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(f[index],style: Theme.of(context).textTheme.headlineLarge,),
                                      Text(""),

                                    ],
                                  )),

                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.black12
                                    ),
                                    image: DecorationImage(image: AssetImage(e[index]),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),

                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12,
                                          width: 2
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Icon(Icons.add,color: Colors.red,))
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        ],
        
      ),
    );
  }
}
