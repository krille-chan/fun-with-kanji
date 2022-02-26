class Kanji {
  final int id;
  final List<String> kanji;
  final String level;
  final String meaning;
  final List<String> readings;
  final List<List<String>> compounds;

  const Kanji({
    required this.id,
    required this.kanji,
    required this.level,
    required this.meaning,
    required this.readings,
    required this.compounds,
  });

  factory Kanji.fromJson(Map<String, dynamic> json) => Kanji(
        id: json['id'],
        kanji: List<String>.from(json['kanji']),
        level: json['level'],
        meaning: json['meaning'],
        readings: List<String>.from(json['readings']),
        compounds: List<List<String>>.from(json['compounds']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'kanji': List<String>.from(kanji),
        'level': level,
        'meaning': meaning,
        'readings': List<String>.from(readings),
        'compounds': List<List<String>>.from(compounds),
      };
}
