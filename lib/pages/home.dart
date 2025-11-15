import 'package:anime_guide/models/anime.dart';
import 'package:anime_guide/pages/about.dart';
import 'package:anime_guide/pages/anime_details.dart';
import 'package:anime_guide/pages/configuration.dart';
import 'package:anime_guide/pages/favorite.dart';
import 'package:anime_guide/pages/profile.dart';
import 'package:anime_guide/pages/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double opacity = 0;
  static const double sizeButton = 30;

  final Map<String, List<int>> sections = {
    'Popular': [0, 3, 1],
    'Emision': [3, 1, 0],
    'Shonen': [3, 2, 1],
  };

  final Map<String, List<int>> shonenAnimes = {
    'Top Accion': [0, 1, 3],
    'Accion Recientes': [1, 0, 3],
    'Accion Clasicos': [1, 3],
  };

  final List<String> preference = [
    'Shonen',
    'Seinen',
    'Gourmet',
    'Space',
    'Sci-fi',
    'Mecha',
    'Thriller',
  ];

  String selectedPreference = 'Normal';
  late final Map<String, Map<String, List<int>>> preferenceSections;

  @override
  void initState() {
    super.initState();

    preferenceSections = {
      'Normal': sections,
      'Shonen': shonenAnimes,
      'Seinen': sections,
      'Gourmet': sections,
      'Thriller': sections,
      'Mecha': sections,
      'Space': sections,
      'Sci-fi': sections,
    };

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectionEntries = (preferenceSections[selectedPreference] ?? sections)
        .entries
        .toList(); //Se transforma en iterable y luego lo transformamos en una listo, esto para poder acceder a los indices

    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 300),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          toolbarHeight: 70,
          title: const Text(
            "Anime Guide",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Acerca()),
                ),
              },
              icon: const Icon(Icons.info_outline_rounded, size: sizeButton),
            ),
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationPage()),
                ),
              },
              icon: const Icon(Icons.settings, size: sizeButton),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 38,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: preference.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final String pref = preference[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () => {
                          setState(() {
                            selectedPreference = pref;
                          }),
                        },

                        child: Text(
                          preference[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
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
                                              builder: (context) =>
                                                  AnimeDetails(id: anime.id),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
                  MaterialPageRoute(builder: (context) => const Home()),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.home_filled, size: sizeButton),
                    const Text("Inicio", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.search, size: sizeButton),
                    const Text("Buscar", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_purple500_outlined, size: sizeButton),
                    const Text("Favoritos", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
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
      ),
    );
  }
}
