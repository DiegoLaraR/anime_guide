import 'package:anime_guide/models/anime.dart';
import 'package:anime_guide/pages/anime_details.dart';
import 'package:anime_guide/pages/favorite.dart';
import 'package:anime_guide/pages/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color backgroundColor1 = const Color.fromARGB(255, 39, 39, 39);
  Color letterColor = const Color.fromARGB(255, 225, 225, 225);
  double opacity = 0;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  final Map<String, List<int>> sections = {
    'Popular': [1, 3, 2],
    'Emision': [3, 1, 0],
    'Shonen': [3, 0, 1],
  };

  @override
  Widget build(BuildContext context) {
    final selectionEntries = sections.entries
        .toList(); //Se transforma en iterable y luego lo transformamos en una listo, esto para poder acceder a los indices
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        backgroundColor: backgroundColor1,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor1,
          toolbarHeight: 90,
          title: Text(
            "Anime Guide",
            style: TextStyle(
              color: letterColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemCount: selectionEntries.length,
          itemBuilder: (context, index) {
            var entry = selectionEntries[index];
            var selectionName = entry.key;
            var items = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    selectionName,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: letterColor,
                    ),
                  ),
                ),

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, itemIndex) {
                      Anime anime = animes[items[itemIndex]];
                      return SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnimeDetails(
                                        name: anime.name,
                                        imageH: anime.imageH,
                                        genre: anime.genre,
                                        season: anime.season,
                                        state: anime.state,
                                        chapter: anime.chapter,
                                        description: anime.description,
                                        autor: anime.autor,
                                        studio: anime.studio,
                                        year: anime.year,
                                        dAnime: anime.dAnime,
                                        dManga: anime.dManga,
                                        characters: anime.characters,
                                      ),
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
                            ),

                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                anime.name,
                                style: TextStyle(
                                  color: letterColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            const SizedBox(height: 16),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
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
                    Icon(Icons.home_filled, size: 40, color: letterColor),
                    Text(
                      "Inicio",
                      style: TextStyle(fontSize: 10, color: letterColor),
                    ),
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
                    Icon(Icons.search, size: 40, color: letterColor),
                    Text(
                      "Buscar",
                      style: TextStyle(fontSize: 10, color: letterColor),
                    ),
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
                    Icon(
                      Icons.star_purple500_outlined,
                      size: 40,
                      color: letterColor,
                    ),
                    Text(
                      "Favoritos",
                      style: TextStyle(fontSize: 10, color: letterColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
