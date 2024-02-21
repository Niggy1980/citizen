import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:js';
class ReGister extends StatelessWidget {
      ReGister({super.key});

      final Id = TextEditingController();
      final Password = TextEditingController();
      final Email = TextEditingController();
      final Datebirth = TextEditingController();
      final Role = TextEditingController();
      final IdenityID = TextEditingController();
      final Firstname = TextEditingController();
      final Lastname = TextEditingController();
      final CollectionReference account = FirebaseFirestore.instance.collection('account');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(17, 45, 78, 1),
          title: Center(
            child:Text("register",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,),),
          ),
        ),
        body: Card(
          child: (
          ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Id,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        icon: Icon(Icons.account_box,color: Colors.blue,size: 40,),
                        labelText: "ID"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Password,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.password_sharp,color: Colors.blue,size: 40,),
                      labelText: "password"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.password_sharp,color: Colors.blue,size: 40,),
                      labelText: "Confirm password"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text("User information",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Firstname,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.face,color: Colors.blue,size: 40,),
                      labelText: "Name"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Lastname,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.face,color: Colors.blue,size: 40,),
                      labelText: "Last name"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: IdenityID,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.credit_card,color: Colors.blue,size: 40,),
                      labelText: "Idenity ID"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Datebirth,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.date_range,color: Colors.blue,size: 40,),
                      labelText: "date of birth",),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300,left: 100),
                child: TextField(
                  controller: Email,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      icon: Icon(Icons.email_outlined,color: Colors.blue,size: 40,),
                      labelText: "E-mail"),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 280,right: 280),
                child: ElevatedButton(onPressed: (){



                }, child: Text("Register",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),),
              ),
            ],
          )
          ),
        ),
      ),
    );
  }
}
