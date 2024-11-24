import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  List <dynamic> userlist= [];
  Future <dynamic> fetchUser()async{
 var apiResponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
 if(apiResponse.statusCode==200||apiResponse.statusCode==201){
   userlist=jsonDecode(apiResponse.body);

   return userlist;
 }else{
   throw Exception("failed to load");
 }

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,

      body:FutureBuilder(
          future: fetchUser(),
          builder: (BuildContext context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Center(child: Text("Error:${snapshot.error}"));
        }else if(snapshot.hasData){
          userlist=snapshot.data!;
          print(userlist);
          return  Center(
            child: Container(
              height: 400,
              width: 300,
              color: Colors.green,
              child: ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 300,
                        color: Colors.greenAccent,
                        child: Center(
                          child: Column(
                            children: [
                              Text("Post ID: ${userlist[index]['postId']}"),
                              Text("ID: ${userlist[index]['id']}"),
                              Text("Name: ${userlist[index]['name']}"),
                              Text("Email: ${userlist[index]['email']}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        }
        return Text("No Data Found");
      }
      ),


    );
  }
}
