import 'package:flutter/material.dart';
import 'dart:async';
import 'package:anime_guide/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color letterColor = const Color.fromARGB(255, 225, 225, 225);
  double opacity = 0;
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          opacity = 0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 700),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.fill,
                height: 200,
                width: 190,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Anime Guide",
              style: TextStyle(
                color: letterColor,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
