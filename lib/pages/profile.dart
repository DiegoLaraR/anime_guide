import 'dart:io';

import 'package:anime_guide/pages/about.dart';
import 'package:anime_guide/pages/configuration.dart';
import 'package:anime_guide/pages/favorite.dart';
import 'package:anime_guide/pages/home.dart';
import 'package:anime_guide/pages/search.dart';
import 'package:anime_guide/providers/configuration_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const double sizeButton = 30;
  late TextEditingController username;

  Future<void> takePicture() async {
    final image = ImagePicker();
    final pickedImage = await image.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final imageDir = '${appDir.path}/profile_image.png';
      final oldImage = File(imageDir);

      if (await oldImage.exists()) {
        await oldImage.delete();
      }

      final saved = await File(pickedImage.path).copy(imageDir);
      await FileImage(saved).evict();

      setState(() {
        context.read<ConfigurationData>().setProfileImagePath(imageDir);
      });
    }
    if (pickedImage == null) return;
  }

  @override
  void initState() {
    super.initState();

    username = TextEditingController(
      text: context.read<ConfigurationData>().getUsername,
    );
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileImage = context.watch<ConfigurationData>().getImagePath;
    username = TextEditingController(
      text: context.watch<ConfigurationData>().getUsername,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        title: const Text(
          "Perfil",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Acerca()),
              ),
            },
            icon: Icon(Icons.info_outline_rounded, size: sizeButton),
          ),
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigurationPage()),
              ),
            },
            icon: Icon(Icons.settings, size: sizeButton),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: FileImage(File(profileImage)),
                radius: 70,
                child: GestureDetector(
                  onTap: () {
                    takePicture();
                  },
                ),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: 290,
                child: TextField(
                  controller: username,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                    labelStyle: TextStyle(fontSize: 18),
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(fontSize: 20),
                  maxLength: 20,
                  textInputAction: TextInputAction.none,
                  onSubmitted: (value) {
                    context.read<ConfigurationData>().setUsername(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.home_filled, size: sizeButton),
                  const Text("Inicio", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search, size: sizeButton),
                  const Text("Buscar", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star_purple500_outlined, size: sizeButton),
                  const Text("Favoritos", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person, size: sizeButton),
                  const Text("Perfil", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
