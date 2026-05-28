import 'package:flutter/material.dart';

class Logo_Login extends StatelessWidget {
  const Logo_Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,

      children: [

        Image.asset(
          'assets/borda.gif',
          width: 200,
        ),

        Image.asset(
          'assets/logo.png',
          width: 800,
        ),
      ],
    );
  }
}