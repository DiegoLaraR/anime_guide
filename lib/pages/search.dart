import 'package:anime_guide/pages/favorite.dart';
import 'package:flutter/material.dart';
import 'package:anime_guide/pages/home.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                "En esta pantalla el usuario podra buscar un anime o manga en especifico",
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
