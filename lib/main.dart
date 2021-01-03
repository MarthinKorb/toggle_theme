import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/components/characters_card.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_theme/models/character.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  List<dynamic> characters = [];

  Future<List<dynamic>> _getCharacters() async {
    final response =
        await http.get('http://hp-api.herokuapp.com/api/characters');

    characters = jsonDecode(response.body);

    return characters;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (_, model, __) {
          _getCharacters();
          return MaterialApp(
            theme: ThemeData.light(), // Provide light theme.
            darkTheme: ThemeData.dark(), // Provide dark theme.
            themeMode: model.mode, // Decides which theme to show.
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Harry Potter Characters'),
                actions: [
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      model.toggleMode();
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              body: Container(
                height: 650,
                child: CharacterCard(
                  characters,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
