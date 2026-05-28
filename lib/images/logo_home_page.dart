import 'dart:async';

import 'package:flutter/material.dart';

class Logo_Home_Page extends StatefulWidget {
  const Logo_Home_Page({super.key});

  @override
  State<Logo_Home_Page> createState() =>
      _Logo_Home_PageState();
}

class _Logo_Home_PageState
    extends State<Logo_Home_Page> {

  int gifAtual = 0;

  final List<String> gifs = [

    'assets/medico1.gif',

    'assets/medico2.gif',

    'assets/medico3.gif',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(

      const Duration(seconds: 4),

      (timer) {

        setState(() {

          gifAtual =
              (gifAtual + 1) % gifs.length;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(

      alignment: Alignment.center,

      children: [

        AnimatedSwitcher(

  duration: const Duration(seconds: 2),

  transitionBuilder: (
    Widget child,
    Animation<double> animation,
  ) {

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },

  child: Opacity(

    opacity: 0.25,

    child: Image.asset(

      gifs[gifAtual],

      key: ValueKey(gifs[gifAtual]),

      width: 280,
      fit: BoxFit.contain,
    ),
  ),
),
      ],
    );
  }
}