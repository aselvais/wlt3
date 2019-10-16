import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wlt3/libs/ApiaccessAbstract.dart';
import 'package:wlt3/models/League.dart';

class ApiaccessWlt extends ApiaccessAbstract {
  String baseurl = 'https://us-central1-wlt3-66c9a.cloudfunctions.net/';

  Future<List<League>> getLeagues() async {
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
}
