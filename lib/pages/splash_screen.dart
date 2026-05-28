import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minha_med_zap/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),

      () {

        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Color(0xFFCDFFD8),
              Color(0xFF94B9FF),
            ],
          ),
        ),

        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset(
                'assets/logo_empresa.png',
                width: 220,
              ),

              const SizedBox(height: 30),

              const Text(
                'A nossa vocação é cuidar\n e habitar no seu coração',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                  fontFamily: 'Manuscrito',
                ),
              ),

              const SizedBox(height: 40),

              CircularProgressIndicator(
                color: const Color.fromARGB(255, 2, 116, 131),
              ),
            ],
          ),
        ),
      ),
    );
  }
}