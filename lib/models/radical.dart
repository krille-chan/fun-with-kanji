import 'package:funny_kanji/models/jp_character.dart';

class Radical extends JpCharacter {
  final int id;
  final String radical;
  final String name;
  final String reading;

  const Radical({
    required this.id,
    required this.radical,
    required this.name,
    required this.reading,
  }) : super();

  factory Radical.fromJson(Map<String, dynamic> json) => Radical(
        id: json['id'],
        radical: json['radical'],
        name: json['name'],
        reading: json['reading'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'radical': radical,
        'name': name,
        'reading': reading,
      };
}
