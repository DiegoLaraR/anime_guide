import 'package:anime_guide/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigurationData extends ChangeNotifier {
  final SharedPreferencesService _sharedPreferencesService;
  String _theme = 'system';
  String _fontFamily = 'Saira Semi Condensed';

  String get getTheme => _theme;
  String get getFontFamily => _fontFamily;

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
}
