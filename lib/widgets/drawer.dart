import 'package:flutter/material.dart';
import 'package:minha_med_zap/pages/messages.dart';
import 'package:minha_med_zap/pages/mylocation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[
          const Divider(),

          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Mensagens"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Messages(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.pin_drop),
            title: const Text("Localização"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyLocation(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}