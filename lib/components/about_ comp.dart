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
          width: 400,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(right: 20),
                  child: Image.network(
                    character['image'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          character['name'],
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Patronus: ${character['ancestry']}'),
                                  Text('Ancestry: ${character['patronus']}'),
                                  Text(
                                      'Date of birth: ${character['dateOfBirth']}'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text('Wand', style: TextStyle(fontSize: 16)),
                                  Text('Wood: ${character['wand']['wood']}'),
                                  Text('Core: ${character['wand']['core']}'),
                                  Text(
                                      'Length: ${character['wand']['length']}'),
                                ],
                              ),
                            )
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
