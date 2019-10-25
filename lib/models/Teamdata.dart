import 'package:wlt3/models/Gamesdata.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/News.dart';
import 'package:wlt3/models/Tweet.dart';

class Teamdata {

  final Team teaminfo;
  final Gamesdata games;
  final List<News> news;
  final List<Tweet> tweets;

  Teamdata({this.teaminfo, this.games, this.news, this.tweets});

  factory Teamdata.fromJson(Map<String, dynamic> json) {

    List<News> newsList = new List();
    json['news'].forEach((json) => newsList.add(News.fromJson(json)));
    List<Tweet> tweetsList = new List();
    json['tweets'].forEach((json) => tweetsList.add(Tweet.fromJson(json)));

    return Teamdata(
      teaminfo: Team.fromJson(json['teaminfo']),
      games: Gamesdata.fromJson(json['games']),
      news: newsList,
      tweets: tweetsList,
    );
  }
}
