import 'package:wlt3/models/Game.dart';

class Gamesdata {
  final List<Game> today;
  final List<Game> past;
  final List<Game> upcoming;

  ///
  ///
  ///
  Gamesdata({this.today, this.past, this.upcoming});
  
  ///
  ///
  ///
  factory Gamesdata.fromJson(Map<String, dynamic> json) {
    List<Game> todayList = new List();
    json['today'].forEach((json) => todayList.add(Game.fromJson(json)));
    List<Game> pastList = new List();
    json['past'].forEach((json) => pastList.add(Game.fromJson(json)));
    List<Game> upcomingList = new List();
    json['upcoming'].forEach((json) => upcomingList.add(Game.fromJson(json)));
    return Gamesdata(
      today: todayList,
      past: pastList,
      upcoming: upcomingList,
    );
  }
}
