class Coefficient {
  Coefficient({this.id, this.title, this.value});

  final int id;
  final String title;
  final double value;

  static Coefficient fromJson(dynamic json) {
    return Coefficient(id: json['id'], title: json['title'], value: json['value']);
  }
}
