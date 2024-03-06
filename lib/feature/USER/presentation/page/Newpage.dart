
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {


  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
readAllData();
  }
  Future<void> readAllirebaseFData()async{
   FirebaseFirestore = firestore.instance;
    CollectionReference collectionReference = FirebaseFirestore.collection('image'
        awaits Col
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child : Text('News')
    );
  }
}

