import 'package:anime_guide/pages/home.dart';
import 'package:anime_guide/pages/search.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                "En esta pantalla el usuario podra ver los animes/mangas que haya agregado a favoritos",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),

      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_filled, size: 40),
                  Text("Inicio", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, size: 40),
                  Text("Buscar", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_purple500_outlined, size: 40),
                  Text("Favoritos", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
