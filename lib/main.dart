import 'package:anime_guide/pages/splash_screen.dart';
import 'package:anime_guide/services/shared_preferences_service.dart';
import 'package:anime_guide/providers/configuration_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfigurationData(SharedPreferencesService()),
      child: Consumer<ConfigurationData>(
        builder: (context, config, _) {
          return MaterialApp(
            title: 'Anime Guide',
            debugShowCheckedModeBanner: false,
            themeMode: config.getThemeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 169, 169, 169),
                brightness: Brightness.light,
              ),
              textTheme: config.getTextTheme(ThemeData.light().textTheme),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
              textTheme: config.getTextTheme(ThemeData.dark().textTheme),
            ),

            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
