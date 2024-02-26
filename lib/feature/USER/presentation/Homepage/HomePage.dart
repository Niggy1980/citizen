import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/NavBarBottom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final  _TitleController = TextEditingController();
  final  _NameController = TextEditingController();
  final  _AddressController = TextEditingController();
  final  complaint = FirebaseFirestore.instance.collection('complaint');

  //add
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot])async{
    String action = 'create';
    if(documentSnapshot != null){
      action = 'update';
      _TitleController.text = documentSnapshot['title'];
      _NameController.text = documentSnapshot['name'];
      _AddressController.text = documentSnapshot['address'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (BuildContext ctx){
          return Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom+20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _TitleController,
                  decoration: const InputDecoration(labelText: 'ชื่อเรื่องร้องเรียน'),
                ),
                TextField(
                  controller: _NameController,
                  decoration: const InputDecoration(labelText: 'ชื่อ  - นามสกุล'),
                ),
                TextField(
                  controller: _AddressController,
                  decoration: const InputDecoration(labelText: 'ที่อยู่'),
                ),
                const SizedBox(height: 25,
                ),
                ElevatedButton (
                    child: Text(action == 'create' ? 'Create' : 'Update'),
                    onPressed: () async {
                final String? title = _TitleController.text;
                final String? name = _NameController.text;
                final String? address = _AddressController.text;

                if (title !=null && name !=null && address !=null){
                  if (action == 'create'){
                    await complaint.add({"title":title,"name":name,"address":address});
                  }
                  if (action == 'update'){
                    await complaint
                        .doc(documentSnapshot!.id)
                        .update({'title':title,"name":name,"address":address});
                  }
                  _TitleController.text='';
                  _NameController.text='';
                  _AddressController.text='';

                  Navigator.of(context).pop();
                }
                    },

                )
              ],
            ),
          );
    });
  }
  //delete
Future<void> _deleteProduct(String productId) async {
    await complaint.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ลบเรียบร้อยเเล้ว')));
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(249, 247, 247, 1.0),
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: Color.fromRGBO(219, 226, 239, 100),
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.newspaper, text: 'News'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
      ),
      body: StreamBuilder(
        stream: complaint.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
          if (streamSnapshort.hasData) {
            return ListView.builder(
                itemCount: streamSnapshort.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshort.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      child: Row(
                        children: [
                         Center(
                           child: Container(
                             child: Column(
                               children: [
                               Align(
                               alignment: Alignment.centerLeft,child: Text(documentSnapshot['title'])),
                             Align(
                               alignment: Alignment.centerLeft,child: Text(documentSnapshot['name'])),
                               Align(
                                 alignment: Alignment.centerLeft,child : Text(documentSnapshot['address'])),
                               ],
                             ),
                           ),
                         ),
                          Container(
                            child:   Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _createOrUpdate(documentSnapshot)),
                           IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _deleteProduct(documentSnapshot.id)),
                  ],
                          ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      //add new
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add_comment),
      ),
    );
  }
}
