class Pokemon {
  final String name;
  final List<String> type;
  final int id;
  final String num;

  Pokemon({
    required this.name,
    required this.type,
    required this.id,
    required this.num,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }
}
