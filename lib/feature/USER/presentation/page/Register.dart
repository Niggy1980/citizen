import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:js';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final Idcontroller = TextEditingController();
final Confirmpassword = TextEditingController();
final Phonenumebercontroller = TextEditingController();
final Passwordcontroller = TextEditingController();
final Emailcontroller = TextEditingController();
final Datebirthcontroller = TextEditingController();
final Rolecontroller = TextEditingController();
final IdenityIDcontroller = TextEditingController();
final Firstnamecontroller = TextEditingController();
final Lastnamecontroller = TextEditingController();
final CollectionReference account = FirebaseFirestore.instance.collection('account');

Future Create([DocumentSnapshot? documentSnapshot]) async {
  await account.add({
    "id": Idcontroller.text,
    "phonenumber": Phonenumebercontroller.text,
    "password": Passwordcontroller.text,
    "email": Emailcontroller.text,
    "datebirth": Datebirthcontroller.text,
    "idenityid": IdenityIDcontroller.text,
    "firstname": Firstnamecontroller.text,
    "lastname": Lastnamecontroller.text,
    "role": "user"
  });
  // Fluttertoast.showToast(msg: "Succesful",timeInSecForIosWeb: 4,);
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(17, 45, 78, 1),
          title: Center(
            child: Text(
              "register",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Card(
          child: (ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Idcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " ID")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      obscureText: true,
                      controller: Passwordcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.password_sharp,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Password")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      obscureText: true,
                      controller: Confirmpassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.password_sharp,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Confirm password")),
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "User information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Firstnamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Firstname")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Lastnamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Lastname")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: IdenityIDcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.credit_card_outlined,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Idenity ID")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Datebirthcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.blue,
                          size: 40,
                        ),
                        labelText: " Date of birth (DD/MM/YYYY)",
                      )),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Emailcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.mail_outline,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " E-mail")),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.green)),

                  child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                      controller: Phonenumebercontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                            size: 40,
                          ),
                          labelText: " Phonoenumber")),
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (Confirmpassword.text != Passwordcontroller.text) {
                      AlertDialog alert = AlertDialog(
                        title: Text('Alert',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )),
                        content: Text("Passwords doesn't match"),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                      return;
                    } else {
                      Create();
                      AlertDialog alert = AlertDialog(
                        title: Text('Success',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            )),
                        content: Text("Account registered"),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LoginPage()),
                              );
                            },
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                      return;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              )),
            ],
          )),
        ),
      ),
    );
  }
}
