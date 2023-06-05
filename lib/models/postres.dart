class Postres {
  final String? postre;
  final String? description;
  final String? date;
  final String? time;
  final String? imageUrl;

  Postres({this.postre, this.description, this.date, this.time, this.imageUrl});
  factory Postres.fromMap(Map<String, dynamic> map) {
    return Postres(
      postre: map['postre'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postre': postre,
      'description': description,
      'date': date,
      'time': time,
      'imageUrl': imageUrl,
    };
  }
}
