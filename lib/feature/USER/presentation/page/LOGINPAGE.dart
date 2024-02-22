import 'dart:js';
import 'package:citizen/feature/USER/presentation/page/Register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final CollectionReference account = FirebaseFirestore.instance.collection('account');

Future Information() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('account').get();
}

class LoginPage extends StatelessWidget {
      LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromRGBO(33, 158, 188, 0.1),
          body: Center(
            child: (Column(
              children: [
                Text("data"),
                Padding(padding: EdgeInsets.only(top: 100)),
                Container(
                  // decoration: BoxDecoration(boxShadow: [BoxShadow(
                  //   color: Colors.green,
                  //   offset: const Offset(
                  //     5.0,
                  //     5.0,
                  //   ),
                  //   blurRadius: 10.0,
                  //   spreadRadius: 2.0,
                  // ), //BoxShadow
                  //   BoxShadow(
                  //     color: Colors.white,
                  //     offset: const Offset(0.0, 0.0),
                  //     blurRadius: 0.0,
                  //     spreadRadius: 0.0,
                  //   ),]),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/image/LOGOCC.png'), width: 400,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.account_circle, color: Colors.blue, size: 40,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                        child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                               width: 350,
                               height: 50,
                               child: TextField(
                               decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter your ID")),
                        ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.key, color: Colors.blue, size: 40,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                        child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                        width: 350,
                        height: 50,
                        child: TextField(
                            obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Enter your Password",)),
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   width: 100,height: 100,
                //
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.red)
                //   ),
                // ), borderrrrrrrrrrr
                Container(
                    child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                    child: Text(
                      "Login",style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/homepage');

                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),),
                    )
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: Text("don't have an account?"),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Register()),
                          );
                        },
                        child: Text("register"),
                      ),
                    ),
                  ],
                )
              ],
            )),
          )),
    );
  }
}
