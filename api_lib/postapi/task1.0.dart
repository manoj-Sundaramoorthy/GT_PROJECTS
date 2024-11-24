import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class task10 extends StatefulWidget {
    Map<String,dynamic> cat={};
    task10({super.key, required cat});

  @override
  State<task10> createState() => _task10State();
}

class _task10State extends State<task10> {
  TextEditingController catId=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController createdby=TextEditingController();

  void initstate(){
    super.initState();
    catId.text=widget.cat["categoryId"].toString();
    category.text=widget.cat["category"]??"null";
    description.text=widget.cat["description"]??"null";
    createdby.text=widget.cat["createdBy"]??"null";
  }

  Future<void> updateCategory(categoryId) async{
    try {
      var apiResponse = await http.post(Uri.parse(
          "http://catodotest.elevadosoftwares.com/Category/InsertCategory/$categoryId"),
          headers: {"content-Type": "application/json"},
          body: jsonEncode({
            "categoryId": catId.text,
            "category": category.text,
            "description": description.text,
            "createdBy": createdby.text
          })
      );

      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        print(apiResponse.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Category updated successfully")));
      }
      else {
        throw Exception("Update failed");
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    final int? categoryId = widget.cat["categoryId"];
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: catId,

          ),
          TextFormField(
            controller: category,
          ),
          TextFormField(
            controller: description,
          ),
          TextFormField(
            controller: createdby,
          ),
          //ElevatedButton(onPressed: (){}, child: Text("DELETE")),
          ElevatedButton(onPressed: (){
            updateCategory(categoryId);
          }, child: Text("UPDATE")),
        ],
      ),

    );
  }
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class task10 extends StatefulWidget {
//     Map<String, dynamic> cat;
//   task10({super.key, required this.cat});
//
//   @override
//   State<task10> createState() => _task10State();
// }
//
// class _task10State extends State<task10> {
//   TextEditingController catId = TextEditingController();
//   TextEditingController category = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController createdby = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the form fields with the values passed from the widget
//     catId.text = widget.cat["categoryId"];
//     print(catId.text.runtimeType);
//     category.text = widget.cat["category"];
//     description.text = widget.cat["description"];
//     createdby.text = widget.cat["createdBy"];
//   }
//
//   Future<void> updateCategory(categoryId) async {
//     try {
//       var apiResponse = await http.post(
//         Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory/$categoryId"),
//         headers: {"content-Type": "application/json"},
//         body: jsonEncode({
//           "categoryId": catId.text,
//           "category": category.text,
//           "description": description.text,
//           "createdBy": createdby.text,
//         }),
//       );
//
//       if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
//         print(apiResponse.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Category updated successfully")),
//         );
//       } else {
//         throw Exception("Update failed");
//       }
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final int categoryId = widget.cat["categoryId"];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Category'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: catId,
//               decoration: InputDecoration(labelText: "Category ID"),
//             ),
//             TextFormField(
//               controller: category,
//               decoration: InputDecoration(labelText: "Category"),
//             ),
//             TextFormField(
//               controller: description,
//               decoration: InputDecoration(labelText: "Description"),
//             ),
//             TextFormField(
//               controller: createdby,
//               decoration: InputDecoration(labelText: "Created By"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Call updateCategory with the proper categoryId
//                 updateCategory(categoryId);
//               },
//               child: Text("UPDATE"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
