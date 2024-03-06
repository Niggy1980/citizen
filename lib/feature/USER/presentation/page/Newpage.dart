
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
    FirebaseFirestore firestore = FirebaseStorage.instance;
    CollectionReference collectionReference = firestore.collection('image');
    await collectionReference.snapshots().listen((response){

      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        print('snapshot = $snapshot');
        print('Name= ${snapshot.data['News']}news');
      }

    });
  }
  widget Showimage(int index){}




  @override
  Widget build(BuildContext context) {
    return Container(
        child : Text('News')
    );
  }
}

