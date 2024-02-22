import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("News"),),
      drawer: MyDrawer(),
    );
  }
}