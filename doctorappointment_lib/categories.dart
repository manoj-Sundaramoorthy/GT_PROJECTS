import 'package:flutter/material.dart';
class CategoriesPage extends StatelessWidget {
  final String category;
  final List<dynamic> doctors;

  CategoriesPage({super.key, required this.category, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(category,style: TextStyle(fontSize: 20),),
          ),
          backgroundColor: Color(0xff3d68eb),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child:Column(
                    children: [
                      Center(child: Text(doctor['name'] ?? "No Name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                  Text(doctor['specialist'] ?? "No Specialist",style: TextStyle(color: Colors.black,fontSize: 15),),
                    ],
                  )));

            },
          ),
        ),
      ),
    );
  }
}