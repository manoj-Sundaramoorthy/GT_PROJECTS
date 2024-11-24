import 'package:flutter/material.dart';



class list2 extends StatefulWidget {
  const list2({super.key});

  @override
  State<list2> createState() => _list2State();
}

class _list2State extends State<list2> {

  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();

  List b=[];


  ad()
  {
    String text1 = username.text;
    String text2 = email.text;
    String text3 = phone.text;


    setState(() {

      b.add("$text1\n$text2\n$text3");
    });
  }

  void nav(String data)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>asd(data: data))).then((editData)
    {
      setState(() {
        b[b.indexWhere((element)=>element==data)]=editData;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: username,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phone,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.numbers),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
              ),
              onPressed: (){
                ad();
              }, child: Text("Click",style: TextStyle(fontSize: 40,color: Colors.black))),
          SizedBox(height: 30),
          Container(
            height: 380,
            width: 380,
            decoration: BoxDecoration(
                border: Border.all()
            ),
            child: ListView.builder(
                itemCount: b.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: ()
                    {
                      nav(b[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: Colors.cyanAccent,
                          child: Text(b[index])),
                    ),
                  );
                }),
          ),

        ],
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
      body: Column(
        children: [
          TextFormField(controller: username,),
          TextFormField(controller: email,),
          TextFormField(controller: phone,),
          ElevatedButton(onPressed: (){

            String editData = "${username.text}\n${email.text}\n${phone.text}";
            Navigator.pop(context,editData);
          }, child: Text("update"))
        ],
      ),
    );
  }
}