import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[300],
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
          const DrawerHeader(
            decoration: BoxDecoration(
             color: Colors.white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage('assets/image/LOGOCC.png'), width: 400,),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title:  Text("H O M E"),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/homepage');
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title:  Text("N E W S"),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/newspage');
            },
          ),
          //
          ListTile(
            leading: Icon(Icons.face),
            title:  Text("P R O F I L E"),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/profilepage');
            },
          ),
          SizedBox(height:310),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
              onTap: (){
                Navigator.pop(context);

                Navigator.pushNamed(context, '/loginpage');

              },
            ),
          )

        ],
      ),
    ],
    ),

    );

  }
}