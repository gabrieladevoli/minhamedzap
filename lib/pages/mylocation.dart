import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Localização"),
      ),
      body: Center(
        child: Text("Sua Localização"),
      ),
      //bottomNavigationBar: MyBottomBar(),
    );
  }
}
