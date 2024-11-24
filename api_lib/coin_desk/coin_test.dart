import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;

class coindesk extends StatefulWidget {
  const coindesk({super.key});

  @override
  State<coindesk> createState() => _coindeskState();
}

class _coindeskState extends State<coindesk> {
  Map<String,dynamic> b={};

  Future<dynamic> fetchData() async{

    final apiResponse=await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    b=jsonDecode(apiResponse.body);

  }
  void initState(){
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("COIN API"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(future: fetchData(), builder: (BuildContext context, snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else if(snapshot.hasError){
                return Text("Error:${snapshot.error}");
              }
              else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("time:\nupdated:${b["time"]["updated"]}"),
                        Text("updatedISO:${b["time"]["updatedISO"]}"),
                         Text("updateduk:${b["time"]["updateduk"]}"),
        
                    SizedBox(height: 50,),
                    Text("disclaimer:${b["disclaimer"]}"),
                     Text("chartName:${b["chartName"]}"),
        
                    SizedBox(height: 50,),
                    Text("bpi:\nUSD:\ncode:${b["bpi"]["USD"]["code"]}"),
                              Text("symbol:${b["bpi"]["USD"]["symbol"]}"),
                                Text("rate:${b["bpi"]["USD"]["rate"]}"),
                         Text("description:${b["bpi"]["USD"]["description"]}"),
                          Text("rate_float:${b["bpi"]["USD"]["rate_float"].toString()}"),
        
                    SizedBox(height: 50,),
                    Text("GBP:\n code:${b["bpi"]["GBP"]["code"]}"),
                         Text("symbol:${b["bpi"]["GBP"]["symbol"]}"),
                           Text("rate:${b["bpi"]["GBP"]["rate"]}"),
                    Text("description:${b["bpi"]["GBP"]["description"]}"),
                     Text("rate_float:${b["bpi"]["GBP"]["rate_float"].toString()}"),

                    SizedBox(height: 50,),
                    Text("USD:\n code:${b["bpi"]["EUR"]["code"]}"),
                              Text("symbol:${b["bpi"]["EUR"]["symbol"]}"),
                                Text("rate:${b["bpi"]["EUR"]["rate"]}"),
                         Text("description:${b["bpi"]["EUR"]["description"]}"),
                          Text("rate_float:${b["bpi"]["EUR"]["rate_float"].toString()}"),



                  ],
                );
              }
        
            })
          ],
        ),
      ),
    );
  }
}
