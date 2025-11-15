import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  String keyTheme = 'theme';
  String keyFont = 'fontFamily';
  String keyFavorites = 'favorites';
  String keyProfileImage = ' profileImage';
  String keyUsername = 'username';

  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyTheme, theme);
  }

  Future<void> saveFont(String fontFamily) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFont, fontFamily);
  }

  Future<void> saveFavorites(List<int?> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    // Conviente la lista de int a una lista de string, esto a traves de un map, el cual convierte cada int a un iterable de widget
    // luego los convierte a string con toString y finalmente los convierte a una lista con toList
    // Esto se hace porque el shared preferences no soporta listas de int, soloamente listas de string
    final asString = favorites.map((e) => e.toString()).toList();
    await prefs.setStringList(keyFavorites, asString);
  }

  Future<void> saveProfileImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyProfileImage, imagePath);
  }

  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, username);
  }

  Future<String?> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyTheme);
  }

  Future<String> loadFont() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyFont) ?? 'Saira Semi Condensed';
  }

  Future<List<int?>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(keyFavorites) ?? [];
    return list
        .map((s) {
          try {
            return int.parse(s);
          } catch (_) {
            return -1;
          }
        })
        .where((id) => id != -1)
        .toList();
  }

  Future<String> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyProfileImage) ?? '';
  }

  Future<String> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername) ?? "";
  }
}
