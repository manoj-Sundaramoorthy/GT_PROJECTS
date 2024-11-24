import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class nationalize_dart extends StatefulWidget {
  const nationalize_dart({super.key});

  @override
  State<nationalize_dart> createState() => _nationalize_dartState();
}

class _nationalize_dartState extends State<nationalize_dart> {
  Map<String,dynamic> c={};
  Future<dynamic> fetchData() async{

    final apiResponse=await http.get(Uri.parse("https://api.nationalize.io/?name=nathaniel"));
    c=jsonDecode(apiResponse.body);

  }
  void initState(){
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Nationalize"),
      ),

      body: Column(
        children: [
          
          Text("count:${c["count"].toString()}"),
          Text("name:${c["name"]}"),
          Text("country:\n${c["country"]}")

        ],
      ),
    );
  }
}
