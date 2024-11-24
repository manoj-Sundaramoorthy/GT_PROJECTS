import 'package:flutter/material.dart';

import 'dashboard.dart';

class Appointment extends StatefulWidget {
  final user;

  const Appointment({Key? key, required this.user}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TextEditingController mobileController = TextEditingController();
  String selectedTime = ''; // Track selected time slot
  DateTime? selectedDate;

  // Method to handle appointment confirmation
  void _confirmAppointment() {
    if (mobileController.text.isEmpty || selectedTime.isEmpty || selectedDate == null) {
      // Show a message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all the details")),
      );
    } else {
      // Show the confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Appointment Confirmed",style: TextStyle(fontSize: 15),),
            content: Text(
              "Appointment for ${widget.user.name} on ${selectedDate?.toLocal().toString().split(' ')[0]} at $selectedTime.\nMobile: ${mobileController.text}",
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()), // Navigate to Dashboard
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime.format(context); // Convert to 12-hour format
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.white),
          backgroundColor: Color(0xff7f7fef),
          title: Text("Appointment", style: TextStyle(color: Colors.white)),
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
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Display User Info
              Container(
              height:100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Doctor: ${widget.user.name}",
                      style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Specialization: ${widget.user.specialist}",
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            
            // Select Appointment Date
            Text(
              "Schedules",
              style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: Color(0xff802314)),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () => _selectDate(context),
                child:
            Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  selectedDate == null
                      ? "Select Date"
                      : "${selectedDate!.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: width * 0.04),
                ),
              ],
            ),
                  ),
                ),
                SizedBox(height: height * 0.02),
            
                // Select Appointment Time
                Text(
                "Visit Hours",
                style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: Color(0xff802314)),
                ),
                SizedBox(height: 10),
                GestureDetector(
                onTap: () => _selectTime(context),
                child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
                ),
                child: Row(
                children: [
                Icon(Icons.access_time, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                selectedTime.isEmpty ? "Select Time" : selectedTime,
                style: TextStyle(fontSize: width * 0.04),
                ),
                ],
                ),
                ),
                ),
                SizedBox(height: height * 0.02),
            
                // Mobile Number Input
                Text(
                "Patient",
                style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: Color(0xff802314)),
                ),
                SizedBox(height: 10),
                TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                ),
                ),
                SizedBox(height: height * 0.02),
            
                // Patient List
                Container(
                height: height * 0.30,
                child: ListView.builder(
                itemCount: 12, // Example count, replace with actual data
                itemBuilder: (BuildContext context, int index) {
                return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 50,
      
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("MRD23", style: TextStyle(color: Colors.black)),
      
                Text("John Smith", style: TextStyle(color: Colors.black)),
                SizedBox(width: 20,),
      
                GestureDetector(
                onTap: () {
                // Handle selection
                },
                child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                color: Color(0xff802314),
                borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text("Select", style: TextStyle(color: Colors.white))),
                ),
                ),
                ],
                ),
                ),
                );
                },
                ),
                ),
            
                // Book Appointment Button
                Center(
                child: SizedBox(
                height: 60,
                width: width * 0.9,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7f7fef),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                ),
                onPressed: _confirmAppointment,
                child: Text("Book Appointment", style: TextStyle(color: Colors.white, fontSize: 23)),
                ),
                ),
                ),
                ],
                ),
          ),
      ),
      ),
    );
  }
}