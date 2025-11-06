import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anime_guide/providers/configuration_data.dart';

class ConfigurationPage extends StatelessWidget {
  ConfigurationPage({super.key});

  final List<String> themes = ['Light', 'Dark', 'System'];
  final List<String> fonts = ['Saira Semi Condensed', 'Roboto', 'Arial'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuration',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 90,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Tema", style: TextStyle(fontSize: 23)),
            DropdownButtonFormField<String>(
              initialValue:
                  context.watch<ConfigurationData>().getTheme == 'light'
                  ? 'Light'
                  : context.watch<ConfigurationData>().getTheme == 'dark'
                  ? 'Dark'
                  : 'System',

              items: [
                for (var theme in themes)
                  DropdownMenuItem(
                    value: theme,
                    child: Text(theme, style: TextStyle(fontSize: 18)),
                  ),
              ],
              onChanged: (value) {
                if (value != null) {
                  if (value == 'Light') {
                    context.read<ConfigurationData>().setTheme('light');
                  } else if (value == 'Dark') {
                    context.read<ConfigurationData>().setTheme('dark');
                  } else {
                    context.read<ConfigurationData>().setTheme('system');
                  }
                }
              },
            ),

            const SizedBox(height: 24),

            Text("Fuente", style: TextStyle(fontSize: 23)),
            DropdownButtonFormField<String>(
              initialValue: context.watch<ConfigurationData>().getFontFamily,
              items: fonts
                  .map(
                    (font) => DropdownMenuItem(
                      value: font,
                      child: Text(font, style: TextStyle(fontSize: 18)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null)
                  context.read<ConfigurationData>().setFontFamily(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
