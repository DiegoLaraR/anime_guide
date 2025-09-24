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

  final List<String> creaciones = const [
    'Pizza',
    'Sandia',
    'Aji',
    'Kimetsu no Yaiba',
  ];
  final List<String> imagenes = const [
    "assets/Pizza.webp",
    "assets/Sandia.webp",
    "assets/Aji.webp",
    "assets/1.webp",
  ];

  final Map<String, List<int>> sections = {
    'Popular': [1, 1, 1],
    'Emision': [3, 2, 0],
    'Shonen': [3, 2, 2],
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
                    itemBuilder: (context, index) {
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
                                      builder: (context) => Home(),
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
                                      imagenes[items[index]],
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
                                creaciones[items[index]],
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
                onPressed: () => Home,
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
                onPressed: () => Home,
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
                onPressed: () => Home,
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
