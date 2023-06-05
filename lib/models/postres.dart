class Postre {
  String id;
  final String description;
  final String date;
  final String time;
  final String imageUrl;

  Postre(
      {this.id = '',
      required this.description,
      required this.date,
      required this.time,
      required this.imageUrl});

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'date': date,
        'time': time,
        'imageUrl': imageUrl
      };

  static Postre fromJson(Map<String, dynamic> json) => Postre(
      id: json['id'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      imageUrl: json['imageUrl']);

  factory Postre.fromMap(Map<String, dynamic> map) {
    return Postre(
      id: map['fields']['id']['stringValue'],
      description: map['fields']['description']['stringValue'],
      date: map['fields']['date']['stringValue'],
      time: map['fields']['time']['stringValue'],
      imageUrl: map['fields']['imageUrl']['stringValue'],
    );
  }
}
