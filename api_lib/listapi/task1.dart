import 'dart:convert';
import 'package:api/listapi/task1_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class jsonlist_api extends StatefulWidget {
  const jsonlist_api({super.key});

  @override
  State<jsonlist_api> createState() => _jsonlist_apiState();
}

class _jsonlist_apiState extends State<jsonlist_api> {

  List<dynamic> userList=[];
  Future<List<dynamic>> fetchUsers() async{
    var apiResponse=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
    if(apiResponse.statusCode==200||apiResponse.statusCode==201){
      userList=jsonDecode(apiResponse.body);
      print(userList);
      return userList.map((json)=>Jsonlist.fromJson(json as Map<String, dynamic>)).toList();

    }
    else{
      throw Exception("Failed to load data");
    }
  }
  void initState(){
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         title: Text("Jsonplaceholder List"),
       ),
      body:FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final userList = snapshot.data!; // This is the list of Jsonlist objects
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return ListTile(
                  title: Text("PostId: ${user.postId}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id: ${user.id}"),
                      Text("Name: ${user.name}"),
                      Text("Email: ${user.email}"),
                      Text("Body: ${user.body}"),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}