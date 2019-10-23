class Standing {

  final num id;
  final String name;

  Standing({this.id, this.name});

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      id: json['id'],
      name: json['name'],
    );
  }
}
