import 'dart:convert';

import 'package:api/postapi/task1.0.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class task1 extends StatefulWidget {
  const task1({super.key});

  @override
  State<task1> createState() => _task1State();
}

class _task1State extends State<task1> {
  var a={};
  List<dynamic> b=[];
  TextEditingController catIdController = TextEditingController();
  TextEditingController catController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController createdbyController = TextEditingController();
  String name="";


  Future Save() async {
    try {
      var apiResponse = await http.post(Uri.parse(
          "http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
          headers: {"content-Type": "application/json"},
          body: jsonEncode(
              {
                "categoryId": catIdController.text,
                "category": catController.text,
                "description": descController.text,
                "createdBy": createdbyController.text
              })
      );
      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Added Successfully")));
        print(jsonDecode(apiResponse.body));
        return jsonDecode(apiResponse.body);
      }

      else {
        throw Exception("Failed to load data");
        }
    }


    catch (e) {
      //print("Error $e");
      return Exception("$e");
    }
  }


  Future<Map<String,dynamic>> getAllIUsers() async{
    var apiResponse=await http.get(Uri.parse("http://catodotest.elevadosoftwares.com//Category/GetAllCategories"));
    if(apiResponse.statusCode==200){
      //print(apiResponse.body);
      a=jsonDecode(apiResponse.body);
      b=a["categoryList"];
      return jsonDecode(apiResponse.body);
    }
    else{
      throw Exception("Failed to load data");
    }
}
  Future<void> deleteCategory(categoryId) async {
    try {
      var apiResponse = await http.post(
          Uri.parse("http://catodotest.elevadosoftwares.com/Category/RemoveCategory/$categoryId"),
        headers: {"Content-Type":"application/json"},
        body:jsonEncode({
          "categoryId":categoryId
        })
      );
      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User deleted successfully")),
        );
        print(apiResponse.body);

        // Update the UI by removing the user from the list
        setState((){
          b.removeWhere((category) => category.categoryId == categoryId);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
void initState(){
    super.initState();
    getAllIUsers();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: catIdController,
            decoration:InputDecoration(
              hintText:"CategoryId"
            ),
          ),
          TextFormField(
            controller: catController,
            decoration:InputDecoration(
                hintText:"Category"
            ),
          ),
          TextFormField(
            controller: descController,
            decoration:InputDecoration(
                hintText:"Description"
            ),
          ),
          TextFormField(
            controller: createdbyController,
            decoration:InputDecoration(
                hintText:"CreatedBy"
            ),
          ),


          ElevatedButton(onPressed: (){Save();}, child: Text("Save")),

          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white38,
                border: Border.all()
            ),
            child: ListView.builder(
                itemCount: b.length,
                itemBuilder: (BuildContext context,int index){
                  final oneCategory=b[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom:5),
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [
                                  Text(oneCategory["categoryId"].toString(), style: TextStyle(fontSize: 25,color: Colors.white)),
                                  Text(oneCategory["category"].toString(), style: TextStyle(fontSize: 25,color: Colors.white)),
                                  Text(oneCategory["description"].toString(), style: TextStyle(fontSize: 25,color: Colors.white)),
                                  Text(oneCategory["createdBy"].toString(), style: TextStyle(fontSize: 25,color: Colors.white)),
                                ],
                              ),

                              //function of-EDIT
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>task10(cat:oneCategory)));
                                  },
                                      icon:  Icon(Icons.edit,color: Colors.white,)),
                                  IconButton(onPressed: (){
                                    deleteCategory(oneCategory["categoryId"]);
                                  }, icon: Icon(Icons.delete)),



                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
//
// import 'dart:convert';
// import 'package:api/postapi/task1.0.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class task1 extends StatefulWidget {
//   const task1({super.key});
//
//   @override
//   State<task1> createState() => _task1State();
// }
//
// class _task1State extends State<task1> {
//   var a = {};
//   List<dynamic> b = [];
//   TextEditingController catIdController = TextEditingController();
//   TextEditingController catController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController createdbyController = TextEditingController();
//
//   // Fetch the categories
//   Future<void> getAllIUsers() async {
//     try {
//       var apiResponse = await http.get(
//         Uri.parse("http://catodotest.elevadosoftwares.com//Category/GetAllCategories"),
//       );
//
//       if (apiResponse.statusCode == 200) {
//         a = jsonDecode(apiResponse.body);
//         setState(() {
//           b = a["categoryList"]; // Update the list in the UI
//         });
//       } else {
//         throw Exception("Failed to load data");
//       }
//     } catch (e) {
//       print("Error fetching categories: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error fetching categories")),
//       );
//     }
//   }
//
//   // Save a new category
//   Future<void> saveCategory() async {
//     try {
//       var apiResponse = await http.post(
//         Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
//         headers: {"content-Type": "application/json"},
//         body: jsonEncode({
//           "categoryId": catIdController.text,
//           "category": catController.text,
//           "description": descController.text,
//           "createdBy": createdbyController.text,
//         }),
//       );
//
//       if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Category Added Successfully")),
//         );
//         setState(() {
//           // Reload categories after saving
//           getAllIUsers();
//         });
//       } else {
//         throw Exception("Failed to add category");
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }
//
//   // Delete a category by its categoryId
//   Future<void> deleteCategory(String categoryId) async {
//     try {
//       var apiResponse = await http.post(
//         Uri.parse("http://catodotest.elevadosoftwares.com/Category/RemoveCategory/$categoryId"),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"categoryId": categoryId}),
//       );
//
//       if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Category deleted successfully")),
//         );
//         setState(() {
//           // Remove the deleted category from the list
//           b.removeWhere((category) => category["categoryId"] == categoryId);
//         });
//       } else {
//         throw Exception("Failed to delete category");
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getAllIUsers(); // Load the categories initially
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Category Management"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           // Form fields for adding a new category
//           TextFormField(
//             controller: catIdController,
//             decoration: InputDecoration(hintText: "Category ID"),
//           ),
//           TextFormField(
//             controller: catController,
//             decoration: InputDecoration(hintText: "Category"),
//           ),
//           TextFormField(
//             controller: descController,
//             decoration: InputDecoration(hintText: "Description"),
//           ),
//           TextFormField(
//             controller: createdbyController,
//             decoration: InputDecoration(hintText: "Created By"),
//           ),
//
//           // Save button
//           ElevatedButton(
//             onPressed: saveCategory,
//             child: Text("Save"),
//           ),
//
//           // ListView displaying categories
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white38,
//                 border: Border.all(),
//               ),
//               child: ListView.builder(
//                 itemCount: b.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final oneCategory = b[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: Container(
//                       color: Colors.black,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     oneCategory["categoryId"].toString(),
//                                     style: TextStyle(fontSize: 25, color: Colors.white),
//                                   ),
//                                   Text(
//                                     oneCategory["category"].toString(),
//                                     style: TextStyle(fontSize: 25, color: Colors.white),
//                                   ),
//                                   Text(
//                                     oneCategory["description"].toString(),
//                                     style: TextStyle(fontSize: 25, color: Colors.white),
//                                   ),
//                                   Text(
//                                     oneCategory["createdBy"].toString(),
//                                     style: TextStyle(fontSize: 25, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//
//                               // Edit and Delete buttons
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => task10(cat: oneCategory),
//                                         ),
//                                       );
//                                     },
//                                     icon: Icon(Icons.edit, color: Colors.white),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       deleteCategory(oneCategory["categoryId"].toString());
//                                     },
//                                     icon: Icon(Icons.delete, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
