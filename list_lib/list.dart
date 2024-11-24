import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  TextEditingController a=TextEditingController();
  TextEditingController ctrl2  = TextEditingController();
  List mylist=[];
  String value="";
  String name="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          height: 550,
          width: 380,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all()
          ),

          child: Padding(
            padding: const EdgeInsets.only(top: 50,bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 55,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all()
                  ),
                  child: TextFormField(
                    controller: a,
                  style: TextStyle(fontSize: 30,color: Colors.black),
                    decoration: InputDecoration(
                    ),
                  ),
                ),

                //CLICK_BTN
                TextButton(
                    style: ElevatedButton.styleFrom(

                        backgroundColor: Colors.greenAccent.shade400,
                    ),
                    onPressed: (){
                      setState(() {
                        double data=double.parse(a.text);
                        mylist.add(data);
                        a.clear();
                      });
                    }, child: Text("ADD",style: TextStyle(fontSize: 20,color: Colors.black))),


                //OTHER-BTNS
                Container(
                  height: 170,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //MIN-BTN
                          TextButton(
                              style: ElevatedButton.styleFrom(

                                  backgroundColor: Colors.greenAccent.shade400
                              ),
                              onPressed: (){
                                setState(() {
                                  mylist.sort();
                                  mylist.first;
                                  print(mylist);
                                });
                                showDialog(
                                    context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text(mylist.first.toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                );
                              },
                              child: Text("MIN",style: TextStyle(fontSize: 20,color: Colors.black))),


                          //MAXIMUM-BTN
                          TextButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent.shade400,
                              ),
                              onPressed: (){
                                setState(() {
                                  mylist.sort();
                                  mylist.last;
                                  print(mylist);
                                });
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text(mylist.last.toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }, child: Text("MAX",style: TextStyle(fontSize: 20,color: Colors.black))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //ACENDING-BTN
                          TextButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent.shade400,
                              ),
                              onPressed: (){
                                setState(() {
                                  mylist.sort();
                                  value=mylist.toString();
                                });
                                showDialog(context: context, builder:(BuildContext context){
                                  return AlertDialog(
                                    title: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text("${value}"),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                );
                              }, child: Text("ACE",style: TextStyle(fontSize: 20,color: Colors.black))),

                          //DECENDING-BTN
                          TextButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent.shade400,
                              ),
                              onPressed: (){
                                setState(() {
                                  mylist.sort();
                                  value=mylist.reversed.toString();
                                });
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text("${value}"),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                );
                              }, child: Text("DEC",style: TextStyle(fontSize: 20,color: Colors.black))),
                        ],
                      ),

                    ],
                  ),
                ),


                //LISTVIEW
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all()
                  ),
                  child: ListView.builder(
                      itemCount: mylist.length,
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Container(
                            height: 50,
                            width: 350,
                            color: Colors.greenAccent.shade400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(mylist[index].toString(),
                                    style: TextStyle(fontSize: 30)),

                                //function of-EDIT
                                Container(
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          showDialog(context: context,
                                            builder: (context) =>AlertDialog(
                                                title:

                                                Container(
                                                  height: 300,
                                                  width: 300,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                    children: [
                                                      TextFormField(

                                                          onChanged: (value){
                                                        setState(() {
                                                          name = value;
                                                        });
                                                      }
                                                      ),



                                                      ElevatedButton(onPressed: (){
                                                        setState(() {
                                                          mylist[index] = name.toString();
                                                          Navigator.of(context).pop();
                                                        });
                                                      },
                                                        child: Text("OK",style: TextStyle(color: Colors.black),),
                                                      )
                                                    ],
                                                  ),
                                                )
                                            ),
                                          );
                                        },
                                            icon:  Icon(Icons.edit)),


                                        //DELETE -BTN
                                        IconButton(onPressed: (){
                                          setState(() {
                                            mylist.removeAt(index);
                                          });
                                        }, icon: Icon(Icons.delete,size: 20,))
                                      ],
                                    )),

                              ],
                            ),
                          ),
                        );
                      }),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}