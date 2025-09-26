import 'package:flutter/material.dart';
import 'package:anime_guide/main.dart';

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({
    super.key,
    required this.name,
    required this.imageH,
    required this.genre,
    required this.season,
    required this.state,
    required this.chapter,
    required this.description,
    required this.autor,
    required this.studio,
    required this.year,
    required this.dAnime,
    required this.dManga,
    required this.characters,
  });

  final String name;
  final String imageH;
  final String genre;
  final String season;
  final String state;
  final String chapter;
  final String description;
  final String autor;
  final String studio;
  final String year;
  final List<String> dAnime; //disponible en anime
  final List<String> dManga; //disponible en manga
  final List<String> characters;

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  Color backgroundColor1 = const Color.fromARGB(255, 39, 39, 39);
  Color letterColor = const Color.fromARGB(255, 225, 225, 225);
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Column(
            children: [
              const SizedBox(height: 64),
              SizedBox(
                height: 240,
                width: 380,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.imageH,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 4,
                        right: 8,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(224, 0, 0, 0),
                          ),
                          onPressed: () => main(),
                          child: Text(
                            "Ver Trailer",
                            style: TextStyle(color: letterColor),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        left: 8,
                        child: IconButton(
                          alignment: AlignmentGeometry.center,
                          onPressed: () => Navigator.pop(context),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color.fromARGB(175, 0, 0, 0),
                          ),
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: letterColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        widget.name,
                        style: TextStyle(
                          color: letterColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () => setState(() {
                          isfavorite = !isfavorite;
                        }),
                        icon: isfavorite
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border),
                        color: letterColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.genre} | ${widget.season}",
                        style: TextStyle(color: letterColor, fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  Row(
                    children: [
                      Text(
                        "${widget.state} | Episodios: ${widget.chapter}",
                        style: TextStyle(color: letterColor, fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "Sinopsis",
                    style: TextStyle(fontSize: 25, color: letterColor),
                  ),

                  SizedBox(
                    height: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.description,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: letterColor, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Ficha Tecnica",
                    style: TextStyle(fontSize: 25, color: letterColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Autor: ${widget.autor} \nEstudio: ${widget.studio} \nAño: ${widget.year}",
                    style: TextStyle(fontSize: 16, color: letterColor),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Disponible en: ",
                    style: TextStyle(fontSize: 25, color: letterColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Anime: ${widget.dAnime.join(', ')} \nManga: ${widget.dManga.join(', ')}",
                    style: TextStyle(fontSize: 16, color: letterColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Personajes Principales",
                    style: TextStyle(fontSize: 25, color: letterColor),
                  ),

                  const SizedBox(height: 4),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 6.0,
                      children: List.generate(widget.characters.length, (
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.characters[index],
                            style: TextStyle(fontSize: 16, color: letterColor),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
