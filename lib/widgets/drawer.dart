import 'package:flutter/material.dart';
import 'package:lollo_e_malu_pages/pages/messages.dart';
import 'package:lollo_e_malu_pages/pages/mylocation.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[
          /*CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExN3prenExbHhodmJobGMzY2lycTFybGIyN201bDNob2RqaHA5cGdwMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/sY729xqAye3krXxltm/giphy.gif'),
          ),*/
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Mensagens"),
            onTap: () {
              Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: ((c) => Messages()
                  )
                )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text("Localização"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                    builder: ((c) => MyLocation()
                    )
                  )
                );
            },
          ),
        ],
      ),
    );
  }
}
