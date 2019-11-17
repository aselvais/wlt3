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

  Future<List<Standing>> getTeamstandingLocalTierGroupGeneric(int divisionId, int tierId) async 
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

  Future<List<Standing>> getTeamstandingLocalTierGroupGenericHeader(int divisionId, int tierId) async 
  {
    String fullurl = baseurl + 'teamstandingLocalTierGroupGenericHeader/?divisionId=' + divisionId.toString() + '&tierId=' + tierId.toString();
    print(fullurl);
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
/*
  Future<List<Standing>> getFeednews(int teamId) async 
  {
    String fullurl = baseurl + 'feednews/?teamId=' + teamId.toString();
    print(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      print(response.body);
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
/*
  Future<List<Standing>> getFeedtwitter(int teamId) async 
  {
    String fullurl = baseurl + 'feedtwitter/?teamId=' + teamId.toString();
    print(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      print(response.body);
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
  /*
   * Fetches the list of dates where we can find games
   */
  Future<List<Matchdates>> getGameall(int seasonId, int divisionId) async 
  {
    String fullurl = baseurl + 'gameall/?' + "seasonId=" + seasonId.toString() + "&divisionId=" + divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      List<Matchdates> toret = new List();
      djson.forEach((json) => toret.add(Matchdates.fromJson(json)));
      return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
/*
  Future<List<Standing>> getGamedetailAllArrays(String date, int teamId) async 
  {
    String fullurl = baseurl + 'gamedetailAllArrays/?date=' + date +
      "&teamId=" + teamId.toString();
    print(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      print(response.body);
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
  Future<List<Game>> getGametoday(String date, int seasonId, int divisionId) async 
  {
    return this.getGames(date, seasonId, divisionId);
  }
/*
  Future<List<Standing>> getTeam(int divisionId) async 
  {
    String fullurl = baseurl + "team/?divisionId=" + divisionId.toString();
    print(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      print(response.body);
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
  Future<Team> getTeamInfo(int teamId) async 
  {
    String fullurl = baseurl + "teamInfo/?teamId=" + teamId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      return Team.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }
  
  Future<Teamdata> getTeamInfoFull(int teamId) async 
  {
    String fullurl = baseurl + "teamInfoFull/?teamId=" + teamId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) 
    {
      return Teamdata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }
/*
  Future<List<Standing>> getTeamstandingHeaders(int divisionId) async 
  {
    String fullurl = baseurl + "teamstandingHeaders/?divisionId=" + divisionId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
/*
  Future<List<Standing>> getTeamstandingLocalTierGroup(int divisionIds, int tierId) async 
  {
    String fullurl = baseurl + "teamstandingLocalTierGroup/?divisionIds=" + divisionIds.toString() + "&tierId=" + tierId.toString();
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
/*
  Future<List<Standing>> getUserdivision(String userId) async 
  {
    String fullurl = baseurl + "userdivision/?userId=" + userId;
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
/*
  Future<List<Standing>> getUsergames(String userId) async 
  {
    String fullurl = baseurl + "usergames/?userId=" + userId;
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/
/*
  Future<List<Standing>> getUserteams(String userId) async 
  {
    String fullurl = baseurl + "userteams/?userId=" + userId;
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      //List<dynamic> djson = json.decode(response.body);
      //List<Standing> toret = new List();
      //djson.forEach((json) => toret.add(Standing.fromJson(json)));
      //return toret;
    } else {
      throw Exception('Failed to load response.body');
    }
  }
*/

}
