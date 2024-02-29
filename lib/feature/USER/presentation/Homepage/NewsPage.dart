import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/NavBarBottom.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NewsPage extends StatelessWidget {
   NewsPage({super.key});


 final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromRGBO(219, 226, 239, 100),
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home') ,
          GButton (icon: Icons.newspaper, text: 'News'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
      ),
    );
  }
}
