import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class postedit extends StatefulWidget {
  final Map<String,dynamic> edit;
    postedit({super.key,required this.edit});

  @override
  State<postedit> createState() => _posteditState();
}

class _posteditState extends State<postedit> {
  TextEditingController catid=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController createdby=TextEditingController();
  @override
  void initState() {
    super.initState();
    // Ensure categoryId is set as a string for the TextController
    catid.text = widget.edit["categoryId"].toString();
    category.text = widget.edit["category"] ?? "";
    description.text = widget.edit["description"] ?? "";
    createdby.text = widget.edit["createdBy"].toString(); // Ensure it's a string
  }
  Future<void> update()async {
    try {
      final apiresponse = await http.post(Uri.parse(
          "http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "categoryId":
          int.parse(catid.text) ?? 0, // Ensure it's an int
          "category": category.text,
          "description": description.text,
          "createdBy": int.parse(createdby.text) ?? 0
        }),
      );
      if (apiresponse.statusCode == 200 || apiresponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Category updated successfully")));
        Navigator.pop(context);
      }
      else {
        throw Exception("Failed to update category");
      }
    }catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Edit Category"),
      ),
      body:Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: catid,
            decoration: InputDecoration(
                hintText: "CategotyID",
                border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: category,
            decoration: InputDecoration(
                hintText: "Category",
                border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: description,
            decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: createdby,
            decoration: InputDecoration(
                hintText:"CreatedBy",
                border: OutlineInputBorder()
            ),
          ),
        ),
        SizedBox(height:10),
        ElevatedButton(onPressed: (){
          update();
        }, child: Text("Update Category"))
      ],
      ),
    );
  }
}