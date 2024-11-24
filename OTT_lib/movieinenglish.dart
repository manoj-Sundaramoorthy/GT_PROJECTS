import 'package:flutter/material.dart';
import 'main.dart';

class movieinenglish extends StatefulWidget {
  const movieinenglish({super.key});

  @override
  State<movieinenglish> createState() => _movieinenglishState();
}

class _movieinenglishState extends State<movieinenglish> {

  List englishmovies=[
    "https://rukminim2.flixcart.com/image/750/900/poster/t/j/b/the-hangover-strips-maxi-poster-pp32366-medium-original-imadaygvyjgqs6gs.jpeg?q=20&crop=false",
    "https://rukminim2.flixcart.com/image/850/1000/kzygpzk0/poster/3/3/5/medium-iron-man-3-official-hd-on-fine-art-paper-hd-quality-original-imagbukknxfghxqn.jpeg?q=20&crop=false",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/b/p/f/small-poster-batman-v-superman-dawn-of-justice-henry-cavill-ben-original-imagm2zjqz7hgttb.jpeg?q=90&crop=false",
    "https://cdn.prod.website-files.com/60f0947cd4564a3db74eecd9/61240db513b08d2128df0c56_black-panther.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcUQ_J6-YweB0ZAmpKh_eU-gGD40XMy-rXRg&s",
    "https://rukminim2.flixcart.com/image/850/1000/l2tcfbk0/poster/x/1/1/small-poster-movie-the-wolverine-x-men-hugh-jackman-wolverine-original-image2rxy7gak8ba.jpeg?q=90&crop=false",
    "https://i0.wp.com/www.nobartv.co.id/wp-content/uploads/2024/08/The-Substance-2024-body-horror.jpg",
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
              color: Colors.red,
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



        ],
      ),

    );
  }
}
