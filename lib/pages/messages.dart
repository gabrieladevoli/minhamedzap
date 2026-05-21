import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Mensagens"),
      ),
      body: Center(
        child: Text("Página de Mensagens"),
      ),
      //bottomNavigationBar: MyBottomBar(),
    );
  }
}
