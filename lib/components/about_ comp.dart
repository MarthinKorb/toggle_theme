import 'package:flutter/material.dart';

class AboutComp extends StatelessWidget {
  final dynamic character;

  AboutComp(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 10),
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Container(
          width: 350,
          height: 300,
          color: Color.fromRGBO(0, 0, 0, 0.3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    character['image'],
                    height: 130,
                  ),
                ),
                Text(
                  character['name'],
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wand',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Wood: ${character['wand']['wood']}'),
                            Text('Core: ${character['wand']['core']}'),
                            Text('Length: ${character['wand']['length']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
