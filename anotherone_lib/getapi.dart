import 'dart:convert';

import 'package:apianotherone/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class api_three extends StatefulWidget {
  const api_three({super.key});

  @override
  State<api_three> createState() => _api_threeState();
}

class _api_threeState extends State<api_three> {

  Future <List<dynamic>> getUser()async{
    var apiResponse=await http.get(Uri.parse("https://api.restful-api.dev/objects"));
    if(apiResponse.statusCode==200){
      return jsonDecode(apiResponse.body);
    }else {
      throw Exception("Failed to load");
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

      body: FutureBuilder(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();

        }else if(snapshot.hasError){
          return Center(child: Text("Error: ${snapshot.hasError}"));
        }else if(snapshot.hasData){
          final data=snapshot.data!;
          print(data);
        return Container(
          height: 400,
          width: 350,
          child: ListView.builder(
            itemCount:data.length,
              itemBuilder: (BuildContext context,int index){
              return Container(
                height:150,
                width: 350,
                child: Column(
                  children: [
                    Text(data[index]["id"].toString()),
                    Text(data[index]["name"].toString()),
                  ],
                ),
              );
              }
          ),
        );
        }else{
         return Text("no data");
        }
      }
      ),
    );
  }
}
