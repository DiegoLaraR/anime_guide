class Anime {
  final String name;
  final String imageP;
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
  final String urlTrailer; //url del trailer

  Anime(
    this.name,
    this.imageP,
    this.imageH,
    this.genre,
    this.season,
    this.state,
    this.chapter,
    this.description,
    this.autor,
    this.studio,
    this.year,
    this.dAnime,
    this.dManga,
    this.characters,
    this.urlTrailer,
  );
}

final List<Anime> animes = [
  Anime(
    "My Hero Academy",
    "assets/heroAcademy.webp",
    "assets/horizontal/heroAcademyH.jpg",
    "Shonen",
    "Temporada 7",
    "Emision",
    "159",
    "En un mundo donde casi todos poseen superpoderes llamados Quirks, Izuku Midoriya, un chico sin poderes, sueña con ser héroe. Su vida cambia cuando conoce a su ídolo All Might, quien le hereda su poder y lo impulsa a entrenar en la UA, una prestigiosa academia para futuros héroes.",
    "Kohei Horikoshi",
    "Estudio BONES",
    "2016",
    ["Crunchyroll", "Netflix", "Hulu"],
    ["VIZ Media"],
    ["Izuku Midoriya", "Katsuki Bakugo", "All Might", "Ochaco Uraraka"],
    "https://www.youtube.com/watch?v=EPVkcwyLQQ8",
  ),
  Anime(
    "Hunter X Hunter",
    "assets/hunterX.jpg",
    "assets/horizontal/hunterXH.webp",
    "Shonen",
    "Temporada 6",
    "Hiatus",
    "148",
    "Hunter x Hunter cuenta la historia de Gon Freecss, un niño que busca convertirse en Hunter para encontrar a su padre. En su viaje conoce a Killua, Kurapika y Leorio, con quienes enfrentará desafíos, enemigos poderosos y misterios, mientras descubre el verdadero significado de la amistad y la aventura.",
    "Yoshihiro Togashi",
    "Nippon Animation",
    "1999",
    ["Crunchyroll", "Netflix", "Amazon Prime Video"],
    ["Manga Plus", "VIZ Media"],
    ["Gon Freecss", "Killua Zoldyck", "Kurapika", "Leorio Paradinight"],
    "https://www.youtube.com/watch?v=F_YR1T_MdCI",
  ),
  Anime(
    "Shokugeki no Soma",
    "assets/shokugeki.jpg",
    "assets/horizontal/shokugekiH.jpg",
    "Gourmet",
    "Temporada 5",
    "Finalizado",
    "86",
    "Soma Yukihira, un joven apasionado por la cocina, entra en la prestigiosa academia culinaria Totsuki, donde los estudiantes compiten en intensos duelos gastronómicos llamados Shokugeki. Allí deberá superar rivales de gran talento para convertirse en un chef de élite.",
    "Yūto Tsukuda, Shun Saeki",
    "Estudio J.C.Staff",
    "2015",
    ["Crunchyroll", "Netflix", "Hulu"],
    ["VIZ Media"],
    ["Soma Yukihira", "Erina Nakiri", "Megumi Tadokoro", "Takumi Aldini"],
    "https://www.youtube.com/watch?v=--v6zWSR_Ko",
  ),
  Anime(
    "Kimetsu no Yaiba",
    "assets/kimetsu.webp",
    "assets/horizontal/kimetsuH.png",
    "Shonen",
    "Temporada 4",
    "Emision",
    "68",
    "Kimetsu no Yaiba cuenta la historia de Tanjiro Kamado, un joven bondadoso que vive en las montañas con su familia. Tras regresar un día y encontrar a toda su familia asesinada por demonios, descubre que su hermana Nezuko ha sobrevivido, pero ha sido transformada en demonio. Decidido a salvarla y vengar a su familia, Tanjiro se une a los Cazadores de Demonios, enfrentándose a criaturas sobrenaturales y peligros mortales. La serie explora la fuerza del vínculo familiar, la lucha entre el bien y el mal, y la determinación frente a la adversidad.",
    "Koyoharu Gotouge",
    "Ufotable",
    "2019",
    ["Crunchyroll", "Netflix", "Amazon Prime Video"],
    ["Manga Plus", "VIZ Media"],
    [
      "Tanjiro Kamado",
      "Nezuko Kamado",
      "Zenitsu Agatsuma",
      "Inosuke Hashibira",
    ],
    "https://www.youtube.com/watch?v=VQGCKyvzIM4",
  ),
];
