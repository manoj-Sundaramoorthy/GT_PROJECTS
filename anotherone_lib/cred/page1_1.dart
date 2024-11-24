import 'dart:convert';

import 'package:apianotherone/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class page1_1 extends StatefulWidget {
  const page1_1({super.key});

  @override
  State<page1_1> createState() => _page1_1State();
}

class _page1_1State extends State<page1_1> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();

  Future <Map<String,dynamic>> getUser()async{
    var apiResponse = await http.get(Uri.parse("http://catodotest.elevadosoftwares.com/Category/GetAllCategories"));
     if (apiResponse.statusCode==200||apiResponse.statusCode==201){
       setState(() {
         getUser();
       });
      return jsonDecode(apiResponse.body);

    } else throw Exception("Failed To Load");
  }


  Future<void> postCategory() async{
    try{
      var apiresponse = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
        headers: {"Content-Type": "application/json"},
        body:  jsonEncode({
          "categoryId":
          int.tryParse(a.text),
          "category": b.text,
          "description": c.text,
          "createdBy":
          int.tryParse(d.text),
        }),

      );
    }catch(e){
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              Colors.yellow.shade900,
              Colors.yellow.shade700,
              Colors.yellow.shade500,
             Colors.yellow.shade300,
              ],
           ),
           ),child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: a,
              decoration: InputDecoration(
                hintText: "categoryId"
              ),
            ),
            TextFormField(
              controller: b,
              decoration: InputDecoration(
                  hintText: "category"
              ),
            ),
            TextFormField(
              controller: c,
              decoration: InputDecoration(
                  hintText: "description"
              ),
            ),
            TextFormField(
              controller: d,
              decoration: InputDecoration(
                hintText: "createdBy"
              ),
            ),
            Container(
                height:40,
                width:100,
                child: FloatingActionButton(onPressed: (){postCategory();},child: Text("ok"),)),

            FutureBuilder(future: getUser(), builder: (BuildContext context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
                return Center(child: Text("Error: ${snapshot.hasError}"));
              }else if(snapshot.hasData){
                final data = snapshot.data!;
                final category=data["categoryList"];
                print(data);


                return Center(
                  child: Container(
                    height: 400,
                    width: 350,
                    color: Colors.black,
                    child: ListView.builder(
                        itemCount: category.length,
                        itemBuilder: (BuildContext context,int index){
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.red.shade900,
                                        Colors.red.shade700,
                                        Colors.red.shade500,
                                        Colors.red.shade300
                                      ]
                                  ),
                                ),

                                height:150,
                                width: 350,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(category[index]["categoryId"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                            Text(category[index]["category"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                            Text(category[index]["description"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                            Text(category[index]["createdBy"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,

                                      child: Row(
                                        children: [
                                          IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Colors.black,)),
                                          IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: Colors.black,)),
                                        ],
                                      ),
                                    )
                                  ],
                                ) ,
                              ),
                            ),
                          );
                        }),
                  ),
                );
              }return Text("no data");
            }),

          ],
        )
    ),
    );

  }
}
