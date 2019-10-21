import 'package:wlt3/models/Arena.dart';
import 'package:wlt3/models/Gameinfo.dart';

class Game {
  final int id;
  final String type;
  final Arena  arena;
  final String time;
  final Gameinfo info;
  final int divisionId;
  final String divisionName;
  final String dateTime;
  final String leagueName;
  final String leagueTimezone;
  final String leagueShortName;
  final String status;
  final String seasonName;
  final bool seasonPlayOff;
  final String shareUrl;
  final String linkStreamVideo;

  Game({
      this.id,
      this.type,
      this.arena,
      this.time,
      this.info,
      this.divisionId,
      this.divisionName,
      this.dateTime,
      this.leagueName,
      this.leagueTimezone,
      this.leagueShortName,
      this.status,
      this.seasonName,
      this.seasonPlayOff,
      this.shareUrl,
      this.linkStreamVideo
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      type: json['type'],
      arena: json['arena'],
      time: json['time'],
      info: json['info'],
      divisionId: json['divisionId'],
      divisionName: json['divisionName'],
      dateTime: json['dateTime'],
      leagueName: json['leagueName'],
      leagueTimezone: json['leagueTimezone'],
      leagueShortName : json['leagueShortName'],
      status: json['status'],
      seasonName: json['seasonName'],
      seasonPlayOff: json['seasonPlayOff'],
      shareUrl: json['shareUrl'],
      linkStreamVideo: json['linkStreamVideo'],
    );
  }
}
