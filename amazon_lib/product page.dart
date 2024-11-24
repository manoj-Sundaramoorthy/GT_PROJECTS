// import 'package:dots_indicator/dots_indicator.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:like_button/like_button.dart';
// import 'package:animated_rating_stars/animated_rating_stars.dart';
// import 'package:like_button/like_button.dart';
class product_page extends StatefulWidget {
  // const amazon({super.key});
  Map oneProduct;
  product_page({Key?key, required this.oneProduct}):super(key: key);

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  String dropdownvalue = 'Item 1';
  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue;
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue.shade200,
        title: Container(
          color: Colors.white,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search, size: 40),
              hintText: "Search Amazon.in",
              hintStyle: TextStyle(fontSize: 20, color: Colors.black54),
              suffixIcon: Icon(Icons.qr_code_scanner),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Container(
                    height: 30,
                    width: 400,
                    child: Text(widget.oneProduct["title"].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
              ],
            ),

            Stack(
                children: [
                  Container(
                    height: 400,
                    width: 400,

                    child:  Image.network(widget.oneProduct["image"]),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/s1.jpg"),fit: BoxFit.fill,
                        )
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 350,top:10),
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.white70,
                        ),
                        child: Icon(Icons.share)),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 402),
                      child: DotsIndicator(dotsCount: 4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 400,
                        left: 300
                    ),
                    child: LikeButton(),
                  ),

                ]
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      // Text("28,000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                      Text(widget.oneProduct["price"].toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text("Sylvi",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                            Text("\t Visit the store",style: TextStyle(fontSize: 20,color: Colors.blue),),

                          ],
                        ),

                      ),
                      AnimatedRatingStars(
                        initialRating:  widget.oneProduct["rating"]["rate"],

                        minRating: 0.0,
                        maxRating: 5.0,
                        filledColor: Colors.amber,
                        emptyColor: Colors.grey,
                        filledIcon: Icons.person,

                        halfFilledIcon: Icons.star_half,
                        emptyIcon: Icons.star_border,
                        onChanged: (double rating) {
                          // Handle the rating change here
                          print('Rating: $rating');
                        },
                        displayRatingValue: true,
                        interactiveTooltips: true,
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half,
                        customEmptyIcon: Icons.star_border,
                        starSize: 30.0,
                        animationDuration: Duration(milliseconds: 300),
                        animationCurve: Curves.easeInOut,
                        readOnly: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 400,
                          child: Text(widget.oneProduct["description"].toString(),style: TextStyle(fontSize: 20),))
                    ],
                  ),
                  Row(
                    children: [

                      Text("EMI",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("from "),
                      Icon(Icons.currency_rupee),
                      Text("1,357.No Cost EMI available."),
                      Text("EMI options",style: TextStyle(color: Colors.blue),),

                    ],
                  ),
                  Row(
                    children: [
                      Text("Inclusive of all taxes"),
                    ],
                  ),

                ],
              ),

            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all()
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/offer.png"),
                        )
                    ),
                  ),
                  Text("All offers & discounts"),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 4),
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "FREE delivery ",style: TextStyle(color: Colors.blue)),
                        TextSpan(text: "Thursday, 26 September. ",style: TextStyle(fontWeight: FontWeight.bold,)),
                        TextSpan(text: "Order\n within "),
                        TextSpan(text: "23 hrs 17 mins. ",style: TextStyle(color: Colors.green)),
                        TextSpan(text: "Details",style: TextStyle(color: Colors.blue))
                      ]
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text("Delivering to Madurai 625016- Update location",style: TextStyle(color: Colors.blue),)
              ],
            ),
            Row(
              children: [
                Text("Only ${widget.oneProduct["rating"]["count"]} left in stock",style: TextStyle(color: Colors.brown,fontSize: 15),),
              ],
            ),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                border:Border.all(),
              ),

              child:  Center(

                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),



            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50,
                  width: 370,

                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                    ),
                    child: Text("Add to Cart",style: TextStyle( fontSize: 20),),
                  )
              ),
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                width: 370,

                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(35)
                ),
                child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ),
                  child: Text("Buy Now",style: TextStyle( fontSize: 20),),
                )
            ),


          ],

        ),
      ),
    );
  }
}