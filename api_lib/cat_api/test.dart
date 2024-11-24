import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  Map<String,dynamic> a={};
  Future<Map<String,dynamic>> fetchData() async{

    final apiResponse=await http.get(Uri.parse("https://catfact.ninja/fact"));
    if(apiResponse.statusCode==200||apiResponse.statusCode==201) {
      a = jsonDecode(apiResponse.body);
      return  a as Map<String,dynamic>;
    }
    else{
      throw Exception("Failed to load data");
    }
  }
  void initState(){
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetApi-1"),
      ),
        body: Column(
        children: [
            FutureBuilder(future: fetchData(), builder: (BuildContext context, snapshot){
               if(snapshot.connectionState==ConnectionState.waiting){
                 return CircularProgressIndicator();
               }
               else if(snapshot.hasError){
                 return Text("Error:${snapshot.error}");
               }
               else if(snapshot.hasData){
                 return Column(
                   children: [
                     Text("fact:${a["fact"]}"),
                     Text("length:${a["length"].toString()}")
                   ],
                 );
               }
               else{
                 return Text("No Data");

              }

            })
        ],
      ),
    );
  }
}
