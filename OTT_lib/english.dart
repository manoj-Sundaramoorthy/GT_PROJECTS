import 'package:flutter/material.dart';
import 'main.dart';

class english extends StatefulWidget {
  const english({super.key});

  @override
  State<english> createState() => _englishState();
}

class _englishState extends State<english> {

  List english=[
    "https://rukminim2.flixcart.com/image/750/900/poster/t/j/b/the-hangover-strips-maxi-poster-pp32366-medium-original-imadaygvyjgqs6gs.jpeg?q=20&crop=false",
    "https://rukminim2.flixcart.com/image/850/1000/kzygpzk0/poster/3/3/5/medium-iron-man-3-official-hd-on-fine-art-paper-hd-quality-original-imagbukknxfghxqn.jpeg?q=20&crop=false",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/b/p/f/small-poster-batman-v-superman-dawn-of-justice-henry-cavill-ben-original-imagm2zjqz7hgttb.jpeg?q=90&crop=false",
    "https://cdn.prod.website-files.com/60f0947cd4564a3db74eecd9/61240db513b08d2128df0c56_black-panther.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcUQ_J6-YweB0ZAmpKh_eU-gGD40XMy-rXRg&s",
    "https://rukminim2.flixcart.com/image/850/1000/l2tcfbk0/poster/x/1/1/small-poster-movie-the-wolverine-x-men-hugh-jackman-wolverine-original-image2rxy7gak8ba.jpeg?q=90&crop=false",
    "https://i0.wp.com/www.nobartv.co.id/wp-content/uploads/2024/08/The-Substance-2024-body-horror.jpg",
  ];


  List walkingdead=[
    "https://ntvb.tmsimg.com/assets/p8282918_b_h8_bn.jpg?w=960&h=540",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSBfjaXQMgGnOey0YQPfJPNYvNQpcR8js_tc5-acw4d9Ru2jUTf-Zhdafif0w5CLHbmnI&usqp=CAU",
    "https://m.media-amazon.com/images/S/pv-target-images/7be464fa2c452829d7809c46ae745c121971b7a0dfa2bfa553dfbfa78d974357.jpg",
    "https://i0.wp.com/hollywoodjesus.com/wp-content/uploads/2024/03/The-Walking-Dead-The-Ones-Who-Live-2024-02.jpg?fit=1200%2C675&ssl=1",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhYC6izBo8v8DyVlcCcbDud1gyO_uYl2Akhw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR8LUw4Hu8cF_QaSi7xSHOCfMRykP-88R6vA&s",
    "https://m.media-amazon.com/images/S/pv-target-images/0b2a408a13a95cc994ffff7500021525fe7e7df437403d81159f95251b5b4876.jpg",
   ];

  List amazonoriginal =[
    "https://images.thedirect.com/media/article_full/boyst.jpg",
    "https://awsimages.detik.net.id/community/media/visual/2024/08/29/the-lord-of-the-rings-the-rings-of-power.jpeg?w=700&q=90",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHgFiFT5ThkVNzB9yoHl7sphyvJFrMBXZh7g&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE8lYJjmGXwdiKJaM_yzioRdOG0__1o_R3Lw&s",
    "https://rukminim2.flixcart.com/image/850/1000/juk4gi80/poster/d/m/t/large-newposter9449-designs-tv-show-breaking-bad-walter-white-original-imaf5tjfegvzyhz9.jpeg?q=20&crop=false",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2nM2d5oboDiOg0ZML6wwX2z9KluKcVFZUXFoWlW2dd6hlNOdrhNjqks7WscblTQkSXfg&usqp=CAU",
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
            height: 250,
            width: 420,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/engilsh.jpg",),
                fit: BoxFit.fill
                ),
            ),
          ),


          TextButton(
            onPressed: (){},
            child: Row(
              children: [
                Text("Movies in English ",
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
              itemCount: english.length,
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
                          image: NetworkImage(english[index],),
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
                Text("The World of The Walking Dead ",
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
              itemCount: walkingdead.length,
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
                          image: NetworkImage(walkingdead[index],),
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
              itemCount: english.length,
              itemBuilder: (Context,index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => english[index]),
                    );
                  },
                  child: Card(
                    child: Container(

                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(english[index],),
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

