import 'dart:convert';

import 'package:apianotherone/cred/diwakar/page2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class post_cat extends StatefulWidget {
  const post_cat({super.key});

  @override
  State<post_cat> createState() => _post_catState();
}

class _post_catState extends State<post_cat> {
  TextEditingController catid=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController createdby=TextEditingController();
  List<dynamic> a =[];
  late Future<void> futureCategories;
  @override
  void initState() {
    super.initState();
    futureCategories = getAllCategories();
  }

  Future<void> getAllCategories() async {
    try {
      var apiResponse = await http.get(
        Uri.parse(
            "http://catodotest.elevadosoftwares.com/Category/GetAllCategories"),
      );
      print("Status Code: ${apiResponse.statusCode}");
      print("Response Body: ${apiResponse.body}");

      if (apiResponse.statusCode == 200) {
        var responseData = jsonDecode(apiResponse.body);
        setState(() {
          a = responseData["categoryList"] ?? [];
          print(a);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load data: ${apiResponse.body}")),
        );
      }
    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }


  Future<void> postCategory() async{
    try {
      var apiresponse = await http.post(Uri.parse(
          "http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "categoryId": int.parse(catid.text) ?? 0, // Ensure it's an int
          "category": category.text,
          "description": description.text,
          "createdBy": int.parse(createdby.text) ?? 0, // Ensure it's an int
        }),
      );
      print(apiresponse.statusCode);
      if (apiresponse.body == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Category added successfully")));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to add category")));
      }
    }
    catch(e){
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }


  Future<void> deleteCategory(int categoryId) async {
    try {
      var apiResponse = await http.post(
        Uri.parse(
            "http://catodotest.elevadosoftwares.com/Category/RemoveCategory"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"categoryId": categoryId}),
      );

      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 204) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Category deleted successfully")),
        );

        // Remove deleted category from the list and update UI
        setState(() {
         // a.removeWhere((category) => category["categoryId"] == categoryId);
          getAllCategories();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete category")),
        );
      }
    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Api"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller:catid,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "CategoryId"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: category,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Category"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: description,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: createdby,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "CreatedBy"
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed:() {postCategory();}, child: Text("Save Category")),
          Expanded(child: FutureBuilder(future: futureCategories, builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (a.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              return ListView.builder(
                itemCount: a.length,
                itemBuilder: (BuildContext context, int index) {
                  final onecat = a[index];

                  return ListTile(
                    title: Text(
                        "Category ID: ${onecat['categoryId'].toString()}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Category: ${onecat['category'] ?? "Unknown Category"}"),
                        Text(
                            "Description: ${onecat['description'] ?? "Unknown Description"}"),
                        Text(
                            "Created By: ${onecat['createdBy'].toString()}"), // Ensure it's displayed as a string
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => postedit(edit:onecat
                                 // edit: {
                                    // ...onecat,
                                    // "categoryId": onecat["categoryId"]
                                    //     .toString(), // Convert categoryId to String
                                 // },
                                ),
                              ),
                            ).then((_) {
                              setState(() {
                                futureCategories =
                                    getAllCategories(); // Refresh the list after editing
                              });
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            if (onecat['categoryId'] != null) {
                              deleteCategory(onecat['categoryId']);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Invalid category ID")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          })),
        ],
      ),
    );
  }
}