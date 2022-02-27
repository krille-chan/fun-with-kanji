import 'package:funny_kanji/models/jp_character.dart';

class Kanji extends JpCharacter {
  final int id;
  final String kanji;
  final List<String> meanings;
  final List<String> readingsOn;
  final List<String> readingsKun;
  final List<String> radicals;

  const Kanji({
    required this.id,
    required this.kanji,
    required this.meanings,
    required this.readingsOn,
    required this.readingsKun,
    required this.radicals,
  }) : super();

  factory Kanji.fromJson(Map<String, dynamic> json) => Kanji(
        id: json['id'],
        kanji: json['kanji'],
        meanings: List<String>.from(json['meanings']),
        readingsOn: List<String>.from(json['readings_on']),
        readingsKun: List<String>.from(json['readings_kun']),
        radicals: List<String>.from(json['radicals'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'kanji': kanji,
        'meanings': List<String>.from(meanings),
        'readings_on': List<String>.from(readingsOn),
        'readings_kun': List<String>.from(readingsKun),
        'radicals': List<String>.from(radicals),
      };
}
