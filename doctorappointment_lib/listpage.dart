import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'doctor appointment.dart';
// Ensure this file exists and is correctly named.

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  List<User> _allUsers = [];
  List<User> _filteredUsers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse("http://92.205.109.210:3000/GetallDoctors"));
      if (response.statusCode == 200) {
        List<dynamic> usersJson = json.decode(response.body)['lst'];
        setState(() {
          _allUsers = usersJson.map((json) => User.fromJson(json)).toList();
          _filteredUsers = _allUsers; // Initially show all users
        });
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _searchUsers(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredUsers = _allUsers; // Reset to show all users
      });
      return;
    }

    setState(() {
      _filteredUsers = _allUsers.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.specialist.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Color(0xff7f7fef),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu,color:Colors.white,),
          ),
          title: Text("Doctor List",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Image.asset("assets/logo.png", height: 30),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Doctor..",
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: _searchUsers, // Call the search function on text change
                ),
              ),
              SizedBox(height: height * 0.02), // Add space between search and list
              _filteredUsers.isEmpty
                  ? Center(child: Text("No users found", style: TextStyle(fontSize: width * 0.05)))
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling issues
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  User user = _filteredUsers[index];
                  return Padding(
                    padding: EdgeInsets.all(padding / 2),
                    child: Container(
                      height: height * 0.10, // Set height based on screen height
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name: ${user.name}", style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
                                  Text("Specialist: ${user.specialist}", style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Book Appointment", style: TextStyle(color: Colors.white))),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Appointment(user: user),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFfdc402),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("7AM - 10PM", style: TextStyle(color: Colors.white))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// User model
class User {
  final String name;
  final String specialist;

  User({required this.name, required this.specialist});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? 'Unknown',
      specialist: json['specialist'] ?? 'Unknown',
    );
  }
}