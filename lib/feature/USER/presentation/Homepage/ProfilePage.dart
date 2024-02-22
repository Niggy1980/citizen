import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/TextBox.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          //profilepic
          const Icon(
            Icons.person,
            size: 120,
          ),
          const SizedBox(height: 20),
          //useremail
          Text("poonnawit@gmail.com",
              textAlign: TextAlign.center,
              style:TextStyle(color: Colors.black)),
          const SizedBox(height: 50),
          //userdetail
          Padding(padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Mydetail',
              style: TextStyle(color:Colors.black ),
            ) ,
          ),

          //username

          MyTextBox(text: 'punnawit', sectionName: 'username',),

          MyTextBox(text: '25/08/02', sectionName: 'datebirthday',),

          MyTextBox(text: '1206598451222', sectionName: 'idenityID',),
        ],
      ),
    );
  }
}
