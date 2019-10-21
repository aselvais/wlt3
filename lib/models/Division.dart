class Division {
  final int id;
  final String name;

  Division({this.id, this.name});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'],
      name: json['name'],
    );
  }
}
