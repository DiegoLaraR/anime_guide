import 'package:anime_guide/providers/configuration_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anime_guide/models/anime.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({super.key, required this.id});

  final int id;

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  bool isfavorite = false;

  late Anime anime;

  Future<void> abrirUrl(String url) async {
    final urlLaunch = Uri.parse(url);
    if (!await launchUrl(urlLaunch)) {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    anime = animes[widget.id];
    return Scaffold(
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
                        anime.imageH,
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
                          onPressed: () => abrirUrl(anime.urlTrailer),
                          child: Text("Ver Trailer"),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        left: 8,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color.fromARGB(175, 0, 0, 0),
                          ),
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text(
                              textAlign: TextAlign.left,
                              anime.name,

                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            iconSize: 25,
                            onPressed: () {
                              final shareText = StringBuffer();
                              shareText.writeln('Título: ${anime.name}');
                              shareText.writeln(
                                'Género: ${anime.genre} | ${anime.season}',
                              );
                              shareText.writeln(
                                'Estado: ${anime.state} | Episodios: ${anime.chapter}',
                              );
                              shareText.writeln('');
                              shareText.writeln('Sinopsis:');
                              shareText.writeln(anime.description);
                              shareText.writeln('');
                              shareText.writeln(
                                'Ficha técnica: Autor: ${anime.autor}, Estudio: ${anime.studio}, Año: ${anime.year}',
                              );
                              shareText.writeln('');
                              shareText.writeln(
                                'Disponible en: Anime: ${anime.dAnime.join(', ')}. Manga: ${anime.dManga.join(', ')}',
                              );
                              shareText.writeln('');
                              shareText.writeln(
                                'Personajes: ${anime.characters.join(', ')}',
                              );
                              shareText.writeln('');
                              shareText.writeln('Trailer: ${anime.urlTrailer}');

                              SharePlus.instance.share(
                                ShareParams(text: shareText.toString()),
                              );
                            },
                            icon: Icon(Icons.share),
                          ),

                          IconButton(
                            iconSize: 30,
                            onPressed: () => setState(() {
                              context.read<ConfigurationData>().toogleFavorites(
                                anime.id,
                              );
                            }),
                            icon:
                                context.read<ConfigurationData>().isFavorite(
                                  anime.id,
                                )
                                ? Icon(Icons.star)
                                : Icon(Icons.star_border),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "${anime.genre} | ${anime.season}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      const SizedBox(height: 2),

                      Row(
                        children: [
                          Text(
                            "${anime.state} | Episodios: ${anime.chapter}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Text("Sinopsis", style: TextStyle(fontSize: 25)),

                      SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            anime.description,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text("Ficha Tecnica", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 4),
                      Text(
                        "Autor: ${anime.autor} \nEstudio: ${anime.studio} \nAño: ${anime.year}",
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 16),
                      Text("Disponible en: ", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 4),
                      Text(
                        "Anime: ${anime.dAnime.join(', ')} \nManga: ${anime.dManga.join(', ')}",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Personajes Principales",
                        style: TextStyle(fontSize: 25),
                      ),

                      const SizedBox(height: 4),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
                          children: List.generate(anime.characters.length, (
                            index,
                          ) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                anime.characters[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
