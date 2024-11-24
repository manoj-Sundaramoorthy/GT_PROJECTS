import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class api_two extends StatefulWidget {
  const api_two({super.key});

  @override
  State<api_two> createState() => _api_twoState();
}

class _api_twoState extends State<api_two> {

   Future <Map<String,dynamic>> getUserData()async{
var apiResponse =await http.get(Uri.parse("https://api.nationalize.io/?name=nathaniel"));
if(apiResponse.statusCode==200||apiResponse.statusCode==201){
return jsonDecode(apiResponse.body);
// b=a["country"];
// print(b);
}else{
  throw Exception("Failed To Load");
}
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
              return Center(child: Text("Error: ${snapshot.hasError}"));
            }else if(snapshot.hasData) {
             final data=snapshot.data!;
             print(data);
             final country=data["country"]as List;
              return Column(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    color: Colors.black,
                    child: ListView.builder(
                        itemCount: country.length,
                        itemBuilder: (BuildContext context,index)
                        {return Container(
                            height: 100,
                            width: 400,
                            color: Colors.red,
                            child:Column(
                              children: [
                                Text(country[index]["country_id"]),
                                Text(country[index]["probability"].toString()),
                              ],
                            )
                        );

                        })
                  )
                ],
              );
            }return Text("No Data");
      })

    );
  }
}
