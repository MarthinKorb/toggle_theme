import 'package:flutter/material.dart';

import 'about_ comp.dart';

class CharacterCard extends StatelessWidget {
  final List<dynamic> characters;

  const CharacterCard(this.characters);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: characters.length,
        itemBuilder: (ctx, index) {
          final ch = characters[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  child: AboutComp(ch),
                );
              },
              leading: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.network(
                  ch['image'],
                  fit: BoxFit.fill,
                  width: 40,
                  height: 40,
                ),
              ),
              title: Text(
                ch['name'],
              ),
              subtitle: Text(
                ch['house'] == '' ? 'House: none' : 'House: ${ch['house']}',
              ),
            ),
          );
        });
  }
}
