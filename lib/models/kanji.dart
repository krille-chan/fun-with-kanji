import 'package:fun_with_kanji/models/jp_character.dart';

class Kanji extends JpCharacter {
  final int id;
  final String kanji;
  final List<String> meanings;
  final List<String> readingsOn;
  final List<String> readingsKun;
  final List<String> radicals;
  final List<KanjiVocab> vocabs;

  const Kanji({
    required this.id,
    required this.kanji,
    required this.meanings,
    required this.readingsOn,
    required this.readingsKun,
    required this.radicals,
    required this.vocabs,
  }) : super();

  factory Kanji.fromJson(Map<String, dynamic> json) => Kanji(
        id: json['id'],
        kanji: json['kanji'],
        meanings: List<String>.from(json['meanings']),
        readingsOn: List<String>.from(json['readings_on']),
        readingsKun: List<String>.from(json['readings_kun']),
        radicals: List<String>.from(json['radicals'] ?? []),
        vocabs: ((json['vocabs'] as List<Map<String, dynamic>>?) ?? [])
            .map((json) => KanjiVocab.fromJson(json))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'kanji': kanji,
        'meanings': List<String>.from(meanings),
        'readings_on': List<String>.from(readingsOn),
        'readings_kun': List<String>.from(readingsKun),
        'radicals': List<String>.from(radicals),
        'vocabs': vocabs.map((vocab) => vocab.toJson()).toList(),
      };
}

class KanjiVocab {
  final String word;
  final String furigana;
  final List<String> translation;

  const KanjiVocab({
    required this.word,
    required this.furigana,
    required this.translation,
  });

  factory KanjiVocab.fromJson(Map<String, dynamic> json) => KanjiVocab(
        word: json['word'],
        furigana: json['furigana'],
        translation: List<String>.from(json['translation']),
      );

  Map<String, dynamic> toJson() => {
        'word': word,
        'furigana': furigana,
        'translation': List<String>.from(translation),
      };
}
