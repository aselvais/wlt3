import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wlt3/libs/ApiaccessAbstract.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/Standing.dart';
import 'package:wlt3/models/Tiers.dart';

class ApiaccessWlt extends ApiaccessAbstract {
  String baseurl = 'https://us-central1-wlt3-66c9a.cloudfunctions.net/';

  Future<List<League>> getLeagues() async 
  {
    final response = await http.get(baseurl + 'league');
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<League> toret = new List();
      djson.forEach((json) => toret.add(League.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  Future<List<Season>> getSeasons(int leagueId) async 
  {
    final response = await http.get(baseurl + 'season?leagueId=' + leagueId.toString());
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Season> toret = new List();
      djson.forEach((json) => toret.add(Season.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  Future<List<Division>> getDivisions(int seasonId) async 
  {
    final response = await http.get(baseurl + 'division?seasonId=' + seasonId.toString());
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Division> toret = new List();
      djson.forEach((json) => toret.add(Division.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  Future<List<Game>> getGames(String date, int seasonId,  int divisionId) async 
  {
    String fullurl = baseurl + 
          'gametoday/?date=' + date +
          '&seasonId=' + seasonId.toString() +
          '&divisionId=' + divisionId.toString();
    final response = await http.get(fullurl);          
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Game> toret = new List();
      djson.forEach((json) => toret.add(Game.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  Future<List<Tiers>> getTiers(int divisionId) async 
  {
    // https://us-central1-wlt3-66c9a.cloudfunctions.net/tier/?divisionId=4052
    String fullurl = baseurl + 'tier/?divisionId=' + divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Tiers> toret = new List();
      djson.forEach((json) => toret.add(Tiers.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  Future<List<Standing>> getStandings(int divisionId, int tierId) async 
  {
    String fullurl = baseurl + 'teamstandingLocalTierGroupGeneric/?divisionId=' + divisionId.toString() + '&tierId=' + tierId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Standing> toret = new List();
      djson.forEach((json) => toret.add(Standing.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }


}
