import 'package:flutter/material.dart';
import 'package:list/formedit.dart';
import 'package:list/main.dart';

class frm1 extends StatefulWidget {
  const frm1({super.key});

  @override
  State<frm1> createState() => _frm1State();
}

class _frm1State extends State<frm1> {


  List mylist=[];

 TextEditingController username =TextEditingController();
  TextEditingController mobile =TextEditingController();
  TextEditingController email =TextEditingController();

  lst(){
    String txt1 = username.text;
    String txt2 = mobile.text;
    String txt3 = email.text;
    setState(() {
      mylist.add("$txt1\n$txt2\n$txt3\n");
    });
  }



  void nav(String data)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>asd(data: data))).then((editData)
    {
      setState(() {
        mylist[mylist.indexWhere((element)=>element==data)]=editData;
      });

    });
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(



      body:Center(
        child: Container(
          height: 900,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.purpleAccent.shade100,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white38,

                ),

                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Name"
                  ),
                  controller: username,


                  style: TextStyle(fontSize: 25,color: Colors.black),
                ),),


              Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mobile_friendly),
                        hintText: "Enter Mobile Number",
                    ),
                    controller: mobile,
                    style: TextStyle(fontSize: 25,color: Colors.black),
                  )),


              Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Enter Email",
                    ),
                    style: TextStyle(fontSize: 25,color: Colors.black),
                  )),



              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                ),
                  onPressed: (){
                   lst();

                  },
                  child: Text(
                    "SHOW",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,color: Colors.black
                    ),
                  ),
                ),

              Container(
                height: 400,
                width:350,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                ),
                child: ListView.builder(
                    itemCount: mylist.length,
                    itemBuilder: (BuildContext context,int index){
                      return GestureDetector(
                        onTap: ()
                        {
                          nav(mylist[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.purpleAccent.shade100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(mylist[index],style: TextStyle(fontSize: 25),),

                                  IconButton(onPressed: (){
                                    setState(() {
                                      mylist.removeAt(index);
                                    });
                                  }, icon: Icon(Icons.delete,size: 30,))

                                ],
                              )),
                        ),



                      );
                    }),
              ),
            ],
          ),
        ),
      ),

    );
  }
}



class asd extends StatefulWidget {
  String data;
  asd({super.key,required this.data});

  @override
  State<asd> createState() => _asdState();
}

class _asdState extends State<asd> {


  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    List<String> lis = widget.data.split("\n");

    username = TextEditingController(text: lis[0]);
    email = TextEditingController(text: lis[1]);
    phone = TextEditingController(text: lis[2]);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.purpleAccent.shade100,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Mobile Number",
                  ),
                  controller: username,
                  style: TextStyle(fontSize: 25,color: Colors.black),
                )),

            Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mobile_friendly),
                    hintText: "Enter Mobile Number",
                  ),
                  controller: email,
                  style: TextStyle(fontSize: 25,color: Colors.black),
                )),
           Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Mobile Number",
                  ),
                  controller: phone,
                  style: TextStyle(fontSize: 25,color: Colors.black),
                )),


            ElevatedButton(onPressed: (){

              String editData = "${username.text}\n${email.text}\n${phone.text}";
              Navigator.pop(context,editData);
            }, child: Text("update"))
          ],
        ),
      ),
    );
  }
}