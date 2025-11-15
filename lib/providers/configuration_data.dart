import 'package:anime_guide/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigurationData extends ChangeNotifier {
  final SharedPreferencesService _sharedPreferencesService;
  String _theme = 'system';
  String _fontFamily = 'Saira Semi Condensed';
  List<int?> favoriteAnimes = [];
  String _profileImagePath = '';
  String _username = "Username";

  String get getTheme => _theme;
  String get getFontFamily => _fontFamily;
  List<int?> get getFavorites => favoriteAnimes;
  String get getImagePath => _profileImagePath;
  String get getUsername => _username;

  ThemeMode get getThemeMode {
    switch (_theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  TextTheme getTextTheme(TextTheme base) {
    switch (_fontFamily) {
      case 'Saira Semi Condensed':
        return GoogleFonts.sairaSemiCondensedTextTheme(base);
      case 'Roboto':
        return GoogleFonts.robotoTextTheme(base);
      default:
        return base;
    }
  }

  ConfigurationData(this._sharedPreferencesService) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _theme = await _sharedPreferencesService.loadTheme() ?? 'system';
    _fontFamily = await _sharedPreferencesService.loadFont();
    favoriteAnimes = await _sharedPreferencesService.loadFavorites();
    _profileImagePath = await _sharedPreferencesService.loadProfileImage();
    _username = await _sharedPreferencesService.loadUsername();
    notifyListeners();
  }

  Future<void> setTheme(String theme) async {
    _theme = theme;
    await _sharedPreferencesService.saveTheme(theme);
    notifyListeners();
  }

  Future<void> setFontFamily(String fontFamily) async {
    _fontFamily = fontFamily;
    await _sharedPreferencesService.saveFont(fontFamily);
    notifyListeners();
  }

  Future<void> toogleFavorites(int id) async {
    if (favoriteAnimes.contains(id)) {
      favoriteAnimes.remove(id);
    } else {
      favoriteAnimes.add(id);
    }
    await _sharedPreferencesService.saveFavorites(favoriteAnimes);
    notifyListeners();
  }

  Future<void> setFavorites(List<int> favorites) async {
    favoriteAnimes = favorites;
    await _sharedPreferencesService.saveFavorites(favorites);
    notifyListeners();
  }

  Future<void> setProfileImagePath(String path) async {
    _profileImagePath = path;
    await _sharedPreferencesService.saveProfileImage(path);
    notifyListeners();
  }

  Future<void> setUsername(String username) async {
    _username = username;
    await _sharedPreferencesService.saveUsername(username);
    notifyListeners();
  }

  bool isFavorite(int id) {
    return favoriteAnimes.contains(id);
  }
}
