import 'dart:convert';

import 'package:flutter/foundation.dart';

class Character {
  final String name;
  final String house;
  final List<Map<String, String>> wand;
  final String patronus;
  final String image;
  Character({
    this.name,
    this.house,
    this.wand,
    this.patronus,
    this.image,
  });

  Character copyWith({
    String name,
    String house,
    List<Map<String, String>> wand,
    String patronus,
    String image,
  }) {
    return Character(
      name: name ?? this.name,
      house: house ?? this.house,
      wand: wand ?? this.wand,
      patronus: patronus ?? this.patronus,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'house': house,
      'wand': wand,
      'patronus': patronus,
      'image': image,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Character(
      name: map['name'],
      house: map['house'],
      wand: List<Map<String, String>>.from(map['wand']?.map((x) => x)),
      patronus: map['patronus'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Character(name: $name, house: $house, wand: $wand, patronus: $patronus, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Character &&
        o.name == name &&
        o.house == house &&
        listEquals(o.wand, wand) &&
        o.patronus == patronus &&
        o.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        house.hashCode ^
        wand.hashCode ^
        patronus.hashCode ^
        image.hashCode;
  }
}
