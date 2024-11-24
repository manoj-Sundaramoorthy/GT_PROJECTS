import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'categories.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> doctors = [];
  List<dynamic> filteredDoctors = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  // Fetch doctors from the API
  Future<void> fetchDoctors() async {
    setState(() {
      isLoading = true; // Show loading spinner while fetching data
    });

    try {
      final apiResponse = await http.get(
        Uri.parse("http://92.205.109.210:3000/GetallDoctors"),
      );

      if (apiResponse.statusCode == 200) {
        final decodedResponse = jsonDecode(apiResponse.body);
        if (decodedResponse.containsKey('lst')) {
          setState(() {
            doctors = decodedResponse['lst']; // Store the list of doctors
            filteredDoctors = doctors; // Initialize filtered list
          });
        } else {
          setState(() {
            doctors = [];
            filteredDoctors = [];
          });
          _showError("No 'lst' key found in the response.");
        }
      } else {
        setState(() {
          doctors = [];
          filteredDoctors = [];
        });
        _showError("Failed to load doctors. Server error.");
      }
    } catch (e) {
      setState(() {
        doctors = [];
        filteredDoctors = [];
      });
      _showError("Failed to fetch doctors. Please check your connection.");
    } finally {
      setState(() {
        isLoading = false; // Stop the loading spinner
      });
    }
  }

  // Display error message
  void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void navigateToCategory(int category) {
    List<dynamic> filteredDoctors = doctors.where((doc) => doc['category'] == category).toList();
    String categoryName = '';

    switch (category) {
      case 4:
        categoryName = 'Heart Specialist';
        break;
      case 3:
        categoryName = 'Dental Specialist';
        break;
      case 2:
        categoryName = 'ENT Specialist';
        break;
      case 1:
        categoryName = 'General';
        break;
      default:
        categoryName = 'Unknown Category';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriesPage(category: categoryName, doctors: filteredDoctors),
      ),
    );
  }

  void _filterDoctors(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDoctors = doctors; // Reset to show all doctors if query is empty
      });
    } else {
      setState(() {
        filteredDoctors = doctors.where((doctor) {
          return doctor['name'].toLowerCase().contains(query.toLowerCase()) ||
              doctor['specialist'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
          
            children: [
              Container(
                height:330,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Color(0xff7f7fef),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.menu, color: Colors.white, size: width * 0.08),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Image.asset("assets/logo.png", height: 20, width: 30),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150,bottom: 20),
                      child: Container(
          
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome Back", style: TextStyle(color: Colors.grey, fontSize: width * 0.06)),
                            Text("Let's Book The", style: TextStyle(color: Colors.white, fontSize: width * 0.08)),
                            Text("Appointment", style: TextStyle(color: Colors.white, fontSize: width * 0.08)),
                          ],
                        ),
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 15,right: 15),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: _filterDoctors,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search Categories",
                          hintStyle: TextStyle(fontSize: width * 0.04),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              // Categories Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff802314),
                        fontSize: width * 0.07,
                      ),
                    ),
                  ),
          
                  Container(
                    height: 105,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          
                        GestureDetector(
                          onTap: () => navigateToCategory(1),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffa38d2c),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage("assets/general.jpg"),
                                  ),
                                ),
                              ),
                              Text("General", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
          
                        GestureDetector(
                          onTap: () => navigateToCategory(3), // Dental Specialist
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff022975),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage("assets/dental.jpg"),
                                  ),
                                ),
                              ),
                              Text("Dental", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
          
                        GestureDetector(
                          onTap: () => navigateToCategory(2), // ENT Specialist
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff034a0c),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage("assets/ear.jpg"),
                                  ),
                                ),
                              ),
                              Text("ENT", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
          
                        GestureDetector(
                          onTap: () => navigateToCategory(4), // Heart Specialist
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffa9aba9),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage("assets/heart.jpg"),
                                  ),
                                ),
                              ),
                              Text("Heart", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Top Doctors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff802314),
                        fontSize: width * 0.07,
                      ),
                    ),
                  ),
                  // ListView to display fetched doctors
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true, // Prevent infinite height issue
                      itemCount: filteredDoctors.length,
                      itemBuilder: (BuildContext context, index) {
                        final doctor = filteredDoctors[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: height * 0.12, // Set height based on screen height
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Name: ${doctor['name'] ?? "No Name"}", style: TextStyle(fontSize: width * 0.05)),
                                      Text("Specialist: ${doctor['specialist'] ?? "No Specialist"}", style: TextStyle(fontSize: width * 0.04, color: Colors.grey)),
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd9b114),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Center(child: Text("7 AM-10 PM")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}