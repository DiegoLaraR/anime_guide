import 'package:anime_guide/pages/about.dart';
import 'package:anime_guide/pages/anime_details.dart';
import 'package:anime_guide/pages/configuration.dart';
import 'package:anime_guide/pages/favorite.dart';
import 'package:anime_guide/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:anime_guide/pages/home.dart';
import 'package:anime_guide/models/anime.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const double sizeButton = 30;
  String searchText = '';
  List<Anime> animes = getAllanimes();
  List<Anime> animeSearch = [];

  Future<void> searchAnime() async {
    animeSearch.clear(); // limpiar la lista primero

    for (Anime anime in animes) {
      if (anime.name.toLowerCase().contains(searchText.toLowerCase())) {
        animeSearch.add(anime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Search",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 90,

        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Acerca()),
            ),
            icon: Icon(Icons.info_outline_rounded, size: sizeButton),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfigurationPage()),
            ),
            icon: Icon(Icons.settings, size: sizeButton),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search an anime',
              onChanged: (String value) {
                setState(() {
                  searchText = value;
                  searchAnime();
                });
              },
            ),
            const SizedBox(height: 10),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: animeSearch.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AnimeDetails(id: animeSearch[index].id),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              animeSearch[index].imageP,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(animeSearch[index].name),
                      ],
                    ),
                  );
                },
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
