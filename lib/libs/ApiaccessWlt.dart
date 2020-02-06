import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wlt3/libs/ApiaccessAbstract.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/Matchdates.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/Standing.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/Teamdata.dart';
import 'package:wlt3/models/Tiers.dart';

class ApiaccessWlt extends ApiaccessAbstract {
  String baseurl = 'https://us-central1-wlt3-66c9a.cloudfunctions.net/';
  // String baseurl = 'http://localhost:5000/wlt3-66c9a/us-central1/';

  ///
  ///
  ///
  Future<List<League>> getLeagues() async {
    final response = await http.get(baseurl + 'league');
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<League>((json) => (League.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Season>> getSeasons(int leagueId) async {
    final response =
        await http.get(baseurl + 'season?leagueId=' + leagueId.toString());
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Season>((json) => (Season.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Division>> getDivisions(int seasonId) async {
    final response =
        await http.get(baseurl + 'division?seasonId=' + seasonId.toString());
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Division>((json) => (Division.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Game>> getGames(String date, int seasonId, int divisionId) async {
    String fullurl = baseurl +
        'gametoday/?date=' +
        date +
        '&seasonId=' +
        seasonId.toString() +
        '&divisionId=' +
        divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Game>((json) => (Game.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  /// Get one game by Id
  ///
  Future<Game> getGame(int gameId) async {
    String fullurl = baseurl +
        'game/?gameId=' + gameId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      dynamic djson = json.decode(response.body);
      return Game.fromJson(djson);
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Tiers>> getTiers(int divisionId) async {
    // https://us-central1-wlt3-66c9a.cloudfunctions.net/tier/?divisionId=4052
    String fullurl = baseurl + 'tier/?divisionId=' + divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Tiers>((json) => (Tiers.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGeneric(
      int divisionId, int tierId) async {
    String fullurl = baseurl +
        'teamstandingLocalTierGroupGeneric/?divisionId=' +
        divisionId.toString() +
        '&tierId=' +
        tierId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }


  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGenericNormalized(
      int divisionId, int tierId) async {
    String fullurl = baseurl +
        'teamstandingLocalTierGroupGenericNormalized/?divisionId=' +
        divisionId.toString() +
        '&tierId=' +
        tierId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGenericHeader(
      int divisionId, int tierId) async {
    String fullurl = baseurl +
        'teamstandingLocalTierGroupGenericHeader/?divisionId=' +
        divisionId.toString() +
        '&tierId=' +
        tierId.toString();
    print(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }


  ///
  /// Fetches the list of dates where we can find games
  ///
  Future<List<Matchdates>> getGameall(int seasonId, int divisionId) async {
    String fullurl = baseurl +
        'gameall/?' +
        "seasonId=" +
        seasonId.toString() +
        "&divisionId=" +
        divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Matchdates>((json) => (Matchdates.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Game>> getGametoday(
      String date, int seasonId, int divisionId) async {
    return this.getGames(date, seasonId, divisionId);
  }

  ///
  ///
  ///
  Future<Team> getTeamInfo(int teamId) async {
    String fullurl = baseurl + "teamInfo/?teamId=" + teamId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      return Team.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<Teamdata> getTeamInfoFull(int teamId) async {
    String fullurl = baseurl + "teamInfoFull/?teamId=" + teamId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      return Teamdata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }

}
