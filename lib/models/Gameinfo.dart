import 'package:wlt3/models/Game.dart';

class Gameinfo {

  final Game team1;
  final Game team2;

  Gameinfo({this.team1, this.team2});

  factory Gameinfo.fromJson(Map<String, dynamic> json) {
    return Gameinfo(
      team1: json['team1'],
      team2: json['team2']
    );
  }
}
