import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:otts/crl_img1.dart';
import 'package:otts/english.dart';
import 'package:otts/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:otts/tamil.dart';
import 'package:otts/telugu.dart';
import 'package:otts/videos_dis_aavesham.dart';
import 'package:otts/videos_dis_breaking%20bad.dart';
import 'package:otts/videos_dis_goat.dart';
import 'package:otts/videos_dis_kalki%202898%20ad.dart';
import 'package:otts/videos_dis_the%20boys.dart';
import 'package:otts/videos_dis_wolverin.dart';

import 'hindi.dart';
import 'kannada.dart';
import 'malayalam.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

int _index=0;

  List mylist =[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1916uCek0F-XFdGZ2uChVt9fJ3pVub6xbLw&s',
    'https://i.redd.it/why-do-these-fan-made-posters-for-goat-look-better-than-the-v0-yl4k2mrm533d1.jpg?width=1820&format=pjpg&auto=webp&s=3854d042e585b2ffb02654b4c52ee7a0a98424f7',
    'https://m.media-amazon.com/images/I/91ty40nKvHL._AC_UF1000,1000_QL80_.jpg',
    'https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/a/k/z/small-spos7591-poster-tv-show-breaking-bad-aaron-paul-bryan-original-imaghnjpvzzrhyun.jpeg?q=90&crop=false',
    'https://images.ottplay.com/images/fahadh-faasil-as-ranga-in-aavesham-1713590777.jpg?impolicy=ottplay-20210210&width=350&height=200',
    'https://media.assettype.com/cinemaexpress%2F2024-07%2F6cf8c048-92e7-41a3-bc27-e1e02772a5ab%2FPrabhas.jpg'
  ];

List pages = [
  Page1(),
  Page2(),
  Page3(),
  Page4(),
  Page5(),
  Page6(),
];



List listview=[
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1916uCek0F-XFdGZ2uChVt9fJ3pVub6xbLw&s',
  'https://i.redd.it/why-do-these-fan-made-posters-for-goat-look-better-than-the-v0-yl4k2mrm533d1.jpg?width=1820&format=pjpg&auto=webp&s=3854d042e585b2ffb02654b4c52ee7a0a98424f7',
  'https://m.media-amazon.com/images/I/91ty40nKvHL._AC_UF1000,1000_QL80_.jpg',
  'https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/a/k/z/small-spos7591-poster-tv-show-breaking-bad-aaron-paul-bryan-original-imaghnjpvzzrhyun.jpeg?q=90&crop=false',
  'https://images.ottplay.com/images/fahadh-faasil-as-ranga-in-aavesham-1713590777.jpg?impolicy=ottplay-20210210&width=350&height=200',
  'https://media.assettype.com/cinemaexpress%2F2024-07%2F6cf8c048-92e7-41a3-bc27-e1e02772a5ab%2FPrabhas.jpg'
  ];

List listviewlang =[
  'assets/engilsh.jpg',
  'assets/tamil.jpg',
  'assets/hindi.jpg',
  'assets/malayalam.jpg',
  'assets/kannada.jpg',
  'assets/telugu.jpg',
];
List languagepages = [
  english(),
  tamil(),
  hindi(),
  malayalam(),
  kannada(),
  telugu(),


];

List amzoriginal=[
  'https://media5.bollywoodhungama.in/wp-content/uploads/2023/01/Farzi-3.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8P_GIPvgbIQYBB5P6aoGEkmpo5zOiyspJLA&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzMvisgGd6NGFFrHTuWNucirK0PHEsKapA1w&s',
  'https://m.media-amazon.com/images/M/MV5BODM5Zjk5MDAtNTFiYy00YjBhLWE3MjEtMDgyMzU5OWVlOTQ4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
  'https://m.media-amazon.com/images/M/MV5BYzA3OTA4ZjAtZWE1Zi00N2RjLWFkMDYtYWI1MzYzMDI5OWY5XkEyXkFqcGc@._V1_.jpg',
  'https://m.media-amazon.com/images/M/MV5BYjZkOGZjZWMtMWJmOS00MDRjLThlMDUtMTgyMzlhODAyMTRkXkEyXkFqcGc@._V1_.jpg',
];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // here the desired height
          child:AppBar(
            backgroundColor: Colors.black,
            title:Container(
            height:30,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                    image: AssetImage("assets/leadinglogo.png"),
                    fit:BoxFit.fill,
                ),

            ),
          ),
          actions: [

            IconButton(onPressed: (){}, icon: Icon(Icons.cast,color: Colors.grey,size: 30,)),
            SizedBox(width: 20,),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(image: AssetImage("assets/profilelogo.png"),
                    fit: BoxFit.fill,
                  ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
        ),
      
      
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  //movies btn
                  Container(
                    width:80,
                    height: 40,
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24,width: 3,),
                  borderRadius: BorderRadius.circular(40)
                  ),
                    child: TextButton(
                        onPressed: (){},
                        child: Text("Movies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      )
                    ),
                  ),
          
                  //tv shows btn
                  SizedBox(width: 10,),
                  Container(
                    width:97,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24,width: 3,),
                      borderRadius: BorderRadius.circular(40)
                  ),
                    child: TextButton(
                        onPressed: (){},
                        child: Text("TV shows",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        )
                    ),
                  ),
          
                  //live tv btn
                  SizedBox(width: 10,),
                  Container(
                    width:80,
                    height:40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24,width: 3,),
                      borderRadius: BorderRadius.circular(40)
                  ),
                    child: TextButton(
                        onPressed: (){},
                        child: Text("Live TV",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        )
                    ),
                  ),
                ],
              ),
          
          
              SizedBox(height: 10),
              CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 250,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 100),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index,reason){
                      setState(() {
                        _index = index;
                      });
                    }
                  ),
                  itemCount: mylist.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    //Watch image
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages[index]),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(mylist[index]
                                 ),
                              fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
          
          
              //dot indicator
              SizedBox(height: 10),
              DotsIndicator(
                dotsCount: mylist.length,
              position: _index,
                    decorator: DotsDecorator(
                      size:const Size.square(7),
                        activeSize: const Size(20.0, 8.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    color: Colors.white, // Inactive color
                    activeColor: Colors.red
              ),
              ),
          
          
              TextButton(
                onPressed: (){},
                  child: Row(
                    children: [
                      Text("Watch for Free-Most populsr shows  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                    ],
                  ),
              ),

              Container(
                height: 120,
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: listview.length,
                  itemBuilder: (Context,index){
                    return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),
                      );
                    },
                      child: Card(
                        child: Container(
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(listview[index],),
                              fit: BoxFit.fill,
                            ),
                          ),
                          ),
                        ),
                    );
                  },
                ),
              ),
          
          
              TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text("Watch in Your Language ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                  ],
                ),
              ),
          
          
              Container(
                height: 120,
                child: ListView.builder(
          
                  scrollDirection: Axis.horizontal,
                  itemCount: listview.length,
                  itemBuilder: (Context,index){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => languagepages[index]),
                        );
                      },
                      child: Card(
                        child: Container(
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(listviewlang[index],),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          
          
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text("Amazon Original series ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                  ],
                ),
              ),
          
          
              Container(
                height: 200,
                child: ListView.builder(
          
                  scrollDirection: Axis.horizontal,
                  itemCount: listview.length,
                  itemBuilder: (Context,index){
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => pages[index]),
                        // );
                      },
                      child: Card(
                        child: Container(

                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(amzoriginal[index],),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          
          
            ],
          ),
        ),
      
      ),
    );
  }
}
