import 'package:anime_guide/pages/about.dart';
import 'package:anime_guide/pages/anime_details.dart';
import 'package:anime_guide/pages/configuration.dart';
import 'package:anime_guide/pages/home.dart';
import 'package:anime_guide/pages/profile.dart';
import 'package:anime_guide/pages/search.dart';
import 'package:provider/provider.dart';
import 'package:anime_guide/providers/configuration_data.dart';
import 'package:flutter/material.dart';
import 'package:anime_guide/models/anime.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late Anime anime;
  static const double sizeButton = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: backgroundColor1,
        toolbarHeight: 90,
        title: const Text(
          "Favoritos",
          style: TextStyle(
            //color: letterColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Acerca()),
              ),
            },
            icon: Icon(Icons.info_outline_rounded, size: sizeButton),
          ),
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigurationPage()),
              ),
            },
            icon: Icon(Icons.settings, size: sizeButton),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: context.watch<ConfigurationData>().getFavorites.isEmpty
                ? [
                    Text(
                      "No tienes nigun animes asignado como favorito",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]
                // Se llama a los animes favoritos desde el provider y luego se convierten en widget a traves de .map
                // tomando el id de cada anime favorito para obtener sus datos
                // y luego se convierten en una lista con .toList()
                // y finalmente se iteran para mostrarlos en pantalla
                // Luego se dibuja por cada anime favorito una card con la imagen y el nombre del anime favorito
                : context.watch<ConfigurationData>().getFavorites.map((id) {
                    final anime = getAnime(id!);

                    return SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AnimeDetails(id: anime.id),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Image.asset(
                                  anime.imageP,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              anime.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
          ),
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
                  Icon(Icons.home_filled, size: sizeButton),
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
                  Icon(Icons.search, size: sizeButton),
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
                  Icon(Icons.star_purple500_outlined, size: sizeButton),
                  Text("Favoritos", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person, size: sizeButton),
                  const Text("Perfil", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
