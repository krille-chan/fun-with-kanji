class Radical {
  final int id;
  final String radical;
  final String name;
  final String reading;

  const Radical({
    required this.id,
    required this.radical,
    required this.name,
    required this.reading,
  });

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
