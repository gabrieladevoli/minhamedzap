import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Mensagens",
          textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(221, 255, 255, 255),
                  fontStyle: FontStyle.italic,
                ),
              ),
      ),
      body: Center(
        child: AlertDialog(
          content: Container(
            width: 500,
            height: 200,
            color: const Color.fromARGB(255, 241, 238, 238),
            child: Center(
              child: Text(
                "Parabens, você fez o seu 1° login! Sinta-se em casa. \n"
                "Com o uso, aqui você verá as mensagens e notificações"
                "referentes às suas consultas e agendamentos.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
      //bottomNavigationBar: MyBottomBar(),
    );
  }
}
