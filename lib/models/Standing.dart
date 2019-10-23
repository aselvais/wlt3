import 'package:wlt3/models/Standingdata.dart';
import 'dart:convert';

class Standing {

  final String title;
  final int metaLeagueid;
  final List<Standingdata> data;

  Standing({this.title, this.metaLeagueid, this.data});

  factory Standing.fromJson(Map<String, dynamic> json) {
    List<Standingdata> toret = new List();
    json['data'].forEach((json) => toret.add(Standingdata.fromJson(json)));
    return Standing(
      title: json['title'],
      metaLeagueid: json['meta_leagueid'],
      data: toret,
    );
  }
}
