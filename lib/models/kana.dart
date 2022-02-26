class Kana {
  final String kana;
  final String roumaji;
  final String type;

  const Kana({
    required this.kana,
    required this.roumaji,
    required this.type,
  });

  factory Kana.fromJson(Map<String, dynamic> json) => Kana(
        kana: json['kana'],
        roumaji: json['roumaji'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'kana': kana,
        'roumaji': roumaji,
        'type': type,
      };
}
