import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  String keyTheme = 'theme';
  String keyFont = 'fontFamily';

  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyTheme, theme);
  }

  Future<void> saveFont(String fontFamily) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFont, fontFamily);
  }

  Future<String?> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyTheme);
  }

  Future<String> loadFont() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyFont) ?? 'Saira Semi Condensed';
  }
}
