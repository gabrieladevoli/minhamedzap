import 'package:flutter/material.dart';
import 'package:lollo_e_malu_pages/pages/assets.dart';
import 'package:lollo_e_malu_pages/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: MyDrawer(),
      ),
      appBar: AppBar(
        title: Center(child: Text("  Bora Programar Flutter!")),
        backgroundColor: Color.fromARGB(148, 25, 118, 210),
        actions: <Widget> [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Center(
        child: Logo_App(),
      ),
      /*bottomNavigationBar: SizedBox(
        height: 100,
        child: MyBottomBar()
      )*/
    );
  }
}