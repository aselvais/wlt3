import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/Team.dart';

class FavoritesModel extends ChangeNotifier
{
  List<Game> _listGames = new List();
  List<Team> _listTeams = new List();
  bool _loadingGames = false;
  bool _loadingTeams = false;
  int _selectedIdGames = -1;
  int _selectedIdTeams = -1;
  Game _selectedModelGames;
  Team _selectedModelTeams;
  String _filename = 'wlt3fluter';
  String directory_path = '';

  /// League / season / division
  League _lastSelectedLeague;
  Season _lastSelectedSeason;
  Division _lastSelectedDivision;  

  ///
  ///
  ///
  isInGamesFavorite(gamesId)
  {
    for (Game i in _listGames)
    {
      if (i.id == gamesId) return true;
    }
    return false;
  }

  ///
  ///
  ///
  isInTeamsFavorite(teamsId)
  {
    for (Team i in _listTeams)
    {
      if (i.teamId == teamsId) return true;
    }
    return false;
  }

  ///
  ///
  ///
  FavoritesModel()
  {
    this._read();
  }
  

  ///
  ///  League _lastSelectedLeague;
  ///
  get lastSelectedLeague
  {
    return _lastSelectedLeague;
  }

  set lastSelectedLeague(League o)
  {
    _saveGeneric(jsonEncode(o.toJson()), '${this.directory_path}/${this._filename}_league.json');
    this._lastSelectedLeague = o;
  }

  ///
  ///  Season _lastSelectedSeason;
  ///
  get lastSelectedSeason
  {
    return _lastSelectedSeason;
  }

  set lastSelectedSeason(Season o)
  {
    _saveGeneric(jsonEncode(o.toJson()), '${this.directory_path}/${this._filename}_season.json');
    this._lastSelectedSeason = o;
  }

  ///
  ///  Division _lastSelectedDivision;
  ///
  get lastSelectedDivision
  {
    return _lastSelectedDivision;
  }

  set lastSelectedDivision(Division o)
  {
    _saveGeneric(jsonEncode(o.toJson()), '${this.directory_path}/${this._filename}_division.json');
    this._lastSelectedDivision = o;
  }

  ///
  ///
  ///
  get listGames {
    return _listGames;
  }

  ///
  ///
  ///
  get listTeams {
    return _listTeams;
  }

  ///
  ///
  ///
  get selectedIdGames {
    return _selectedIdGames;
  }

  ///
  ///
  ///
  get selectedIdTeams {
    return _selectedIdTeams;
  }

  ///
  ///
  ///
  get loadingGames {
    return _loadingGames;
  }

  ///
  ///
  ///
  get loadingTeams {
    return _loadingTeams;
  }

  ///
  ///
  ///
  get selectedModelGames {
    return _selectedModelGames;
  }

  ///
  ///
  ///
  get selectedModelTeams {
    return _selectedModelTeams;
  }

  ///
  ///
  ///
  set selectedModelGames(Game v)
  {
    _selectedModelGames = v;
    notifyListeners();
  }
  
  ///
  ///
  ///
  set selectedModelTeams(Team v)
  {
    _selectedModelTeams = v;
    notifyListeners();
  }
  
  ///
  ///
  ///
  set selectedIdGames(int v)
  {
    _selectedIdGames = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedIdTeams(int v)
  {
    _selectedIdTeams = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set loadingGames(bool v)
  {
    _loadingGames = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set loadingTeams(bool v)
  {
    _loadingTeams = v;
    notifyListeners();
  }

  ///
  ///
  ///
  addToListGames(Game o)
  {
    _listGames.add(o);
    _saveGames();
    notifyListeners();
  }

  ///
  ///
  ///
  addToListTeams(Team o)
  {
    _listTeams.add(o);
    _saveTeams();
    notifyListeners();
  }

  ///
  ///
  ///
  _replaceListGames(List<Game> o)
  {
    o.forEach((f) => _listGames.add(f));
    this.loadingGames = false;
  }

  ///
  ///
  ///
  _replaceListTeams(List<Team> o)
  {
    o.forEach((f) => _listTeams.add(f));
    this.loadingTeams = false;
  }

  ///
  ///
  ///
  _read() async {
    final directory = await getApplicationDocumentsDirectory();
    this.directory_path = directory.path;

    try {
      final fileLeague = File('${this.directory_path}/${this._filename}_league.json');
      String jsonLeague = await fileLeague.readAsString();
      Object _jsonLeague = jsonDecode(jsonLeague);
      _lastSelectedLeague = League.fromJson(_jsonLeague);
    } catch (e) { print("Couldn't read ${this.directory_path}/${this._filename}_league.json file and process file"); }

    try {
      final fileSeason = File('${this.directory_path}/${this._filename}_season.json');
      String jsonSeason = await fileSeason.readAsString();
      Object _jsonSeason = jsonDecode(jsonSeason);
      _lastSelectedSeason = Season.fromJson(_jsonSeason);
    } catch (e) { print("Couldn't read ${this.directory_path}/${this._filename}_season.json file and process file"); }

    try {
      final fileDivision = File('${this.directory_path}/${this._filename}_division.json');
      String jsonDivision = await fileDivision.readAsString();
      Object _jsonDivision = jsonDecode(jsonDivision);
      _lastSelectedDivision = Division.fromJson(_jsonDivision);
    } catch (e) { print("Couldn't read ${this.directory_path}/${this._filename}_division.json file and process file"); }

    try {
      final fileGames = File('${this.directory_path}/${this._filename}_games.json');
      String jsonGames = await fileGames.readAsString();
      List _jsonGames = jsonDecode(jsonGames);
      _listGames = _jsonGames.map((e) => Game.fromJson(e)).toList();
    } catch (e) { print("Couldn't read ${this.directory_path}/${this._filename}_games.json file and process file"); }

    try {
      final fileTeams = File('${this.directory_path}/${this._filename}_teams.json');
      String jsonTeams = await fileTeams.readAsString();
      List _jsonTeams = jsonDecode(jsonTeams);
      _listTeams = _jsonTeams.map((e) => Team.fromJson(e)).toList();
    } catch (e) { print("Couldn't read ${this.directory_path}/${this._filename}_teams.json file and process file"); }
  }

  ///
  ///
  ///
  _saveGames() async {
    var json = jsonEncode(_listGames.map((e) => e.toJson()).toList());
    final file = File('${this.directory_path}/${this._filename}_games.json');
    await file.writeAsString(json);
    print('Games saved');
  }

  ///
  ///
  ///
  _saveTeams() async {
    var json = jsonEncode(_listTeams.map((e) => e.toJson()).toList());
    await this._saveGeneric(json, '${this.directory_path}/${this._filename}_teams.json');
    print('Teams saved');
  }

  ///
  ///
  ///
  _saveGeneric(String json, String filename) async {
    try {
      final file = File(filename );
      await file.writeAsString(json);
    } catch(eee) {
      print('Can not write ' + filename );
    }
  }



}