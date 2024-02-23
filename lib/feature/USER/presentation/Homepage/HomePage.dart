import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();
  final CollectionReference complaint = FirebaseFirestore.instance.collection('complaint');

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
                ElevatedButton(
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

  //show snackbar



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      ),
      drawer: MyDrawer(),
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
                    child: ListTile(
                      title: Text(documentSnapshot['title']),
                      subtitle: Text(documentSnapshot['name']),

                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _createOrUpdate(documentSnapshot)),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => (documentSnapshot.id)),
                        ],
                      ),
                    ),),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
