import 'package:flutter/material.dart';
import 'package:foodapp/page2.dart';
import 'package:foodapp/page3.dart';
import 'package:google_fonts/google_fonts.dart';


import 'main.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {

  List a=[
    "assets/pizza.png",
    "assets/salad.jpg",
    "assets/deserts.png",
    "assets/pasta.png",
    "assets/coffee.png",
  ];

  List b=[
    "Pizza",
    "Salads",
    "Deserts",
    "pasta",
    "Beverage",
  ];

  List d=[
    "23 Varieties",
    "12 Varieties",
    "37 Varieties",
    "11 Varieties",
    "47 Varieties",
  ];

  // List e=[
  //   page2(),
  //   page3(),
  //
  // ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(

        body: Stack(
          children:[
            Container(
              height: double.infinity,
              width: 150,
              color: Colors.redAccent,
            ),
            Container(
            child: Center(
              child: Column(
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
                    Icon(Icons.list),
                    Icon(Icons.shopping_bag_outlined,color: Colors.redAccent,)
                                    ],
                                  ),
                  ),
                            ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 600,
                  width: 350,
                  child: ListView.builder(

                    scrollDirection: Axis.vertical,
                    itemCount: a.length,
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
                                          Text(b[index],style: Theme.of(context).textTheme.headlineLarge,),
                                          Text(d[index],style: Theme.of(context).textTheme.headlineMedium,),

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
                                    image: DecorationImage(image: AssetImage(a[index]),
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
                                    child: Icon(Icons.arrow_forward_ios,color: Colors.red,))
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

              ],
                            ),
            ),
          ),
    ]
        ),
      ),
    );
  }
}
