import 'package:flutter/material.dart';
import 'main.dart';

class hindi extends StatefulWidget {
  const hindi({super.key});

  @override
  State<hindi> createState() => _hindiState();
}

class _hindiState extends State<hindi> {

  List hindi=[
    "https://pbs.twimg.com/media/FGksofnVIAkuo_B.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0f1T4DKBALlTBV1vFnMteb8WlawYED6qSGw&s",
    "https://m.media-amazon.com/images/S/pv-target-images/ff1bda2b0acab89448085f16fcb4166ed741f0d83ee5f38d85c88bb3332eb87e.jpg",
    "https://s1.dmcdn.net/v/Hrz9w1O28bGCs1WKi/x720",
  ];


  List dubbedhindi=[
    "https://upload.wikimedia.org/wikipedia/en/d/d2/Farzi.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbX0Jt93X_egAOTMdfJvng8sQYU6AP8WyAHQ&s",
    "https://m.media-amazon.com/images/M/MV5BYTdmNWUwMGMtNmIzNy00ZTc2LTlmYjQtYzMwYjAyYjVkZmNmXkEyXkFqcGc@._V1_.jpg",
    "https://media.assettype.com/freepressjournal/2024-10-07/bp18qqvt/According-to-the-Karnataka-State-Natural-Disaster-Management-Centre-KSNDMC-widespread-moderate-rain-and-scattered-heavy-rain-with-thunder-and-lightning-are-likely-over-coastal-and-hilly-regions-2.jpg",
    "https://upload.wikimedia.org/wikipedia/en/d/dc/The_Family_Man.jpeg",

  ];

  List recentlyadded =[
    "https://assets-in.bmscdn.com/discovery-catalog/events/et00408228-sydsnedkrd-landscape.jpg",
    "https://m.media-amazon.com/images/S/pv-target-images/95c12af5a618b3a52bfda246968517e608fedeb698a9aebc202356c1f9071304._SX1080_FMjpg_.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnX6_PRKPVGaoPymzveb9cviERv-U30lXFvYhr-ArELcHAr0PSiqpln76nIkz861Bo7OU&usqp=CAU",
    "https://assets-in.bmscdn.com/discovery-catalog/events/et00406305-zwkvcmkrhc-landscape.jpg",
    "https://assets-in.bmscdn.com/discovery-catalog/events/et00343702-fdbwkeucze-landscape.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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

      body: Column(
        children: [
          Container(
            height: 200,
            width: 420,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/hindi.jpg",),
                  fit: BoxFit.fill
              ),
            ),
          ),

          TextButton(
            onPressed: (){},
            child: Row(
              children: [
                Text("Movies in Hindi ",
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
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hindi.length,
              itemBuilder: (Context,index){
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => [index]),
                    // );
                  },
                  child: Card(
                    child: Container(

                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(hindi[index],),
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
                Text("Movie dubbed in Telugu ",
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
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dubbedhindi.length,
              itemBuilder: (Context,index){
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => english[index]),
                    // );
                  },
                  child: Card(
                    child: Container(

                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(dubbedhindi[index],),
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
                Text("Recently added movies ",
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
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentlyadded.length,
              itemBuilder: (Context,index){
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => recentlyadded[index]),
                    // );
                  },
                  child: Card(
                    child: Container(

                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(recentlyadded[index],),
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
    );
  }
}
