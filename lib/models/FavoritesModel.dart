import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:wlt3/models/Game.dart';
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

  
  get listGames {
    return _listGames;
  }

  get listTeams {
    return _listTeams;
  }

  get selectedIdGames {
    return _selectedIdGames;
  }

  get selectedIdTeams {
    return _selectedIdTeams;
  }

  get loadingGames {
    return _loadingGames;
  }

  get loadingTeams {
    return _loadingTeams;
  }

  get selectedModelGames {
    return _selectedModelGames;
  }

  get selectedModelTeams {
    return _selectedModelTeams;
  }

  set selectedModelGames(Game v)
  {
    _selectedModelGames = v;
    notifyListeners();
  }
  
  set selectedModelTeams(Team v)
  {
    _selectedModelTeams = v;
    notifyListeners();
  }
  
  set selectedIdGames(int v)
  {
    _selectedIdGames = v;
    notifyListeners();
  }

  set selectedIdTeams(int v)
  {
    _selectedIdTeams = v;
    notifyListeners();
  }

  set loadingGames(bool v)
  {
    _loadingGames = v;
    notifyListeners();
  }

  set loadingTeams(bool v)
  {
    _loadingTeams = v;
    notifyListeners();
  }

  addToListGames(Game o)
  {
    _listGames.add(o);
    _saveGames();
    notifyListeners();
  }

  addToListTeams(Team o)
  {
    _listTeams.add(o);
    _saveTeams();
    notifyListeners();
  }

  _replaceListGames(List<Game> o)
  {
    o.forEach((f) => _listGames.add(f));
    this.loadingGames = false;
  }

  _replaceListTeams(List<Team> o)
  {
    o.forEach((f) => _listTeams.add(f));
    this.loadingTeams = false;
  }

  loadDataGames(int gameId)
  {
    /*
    this.loading = true;
    String date = DateFormat("yyyy-MM-dd").format(this._selectedDate);
    _listGames = new List();
    
    _api.getGames(date, seasonId, divisionId)
      .then((dt) => _replaceList(dt) )
      .catchError((e) => throw Exception(e))
      .whenComplete(() => notifyListeners() );
    */
  }

  loadDataTeams(int teamId)
  {
    /*
    this.loading = true;
    String date = DateFormat("yyyy-MM-dd").format(this._selectedDate);
    _listGames = new List();
    
    _api.getGames(date, seasonId, divisionId)
      .then((dt) => _replaceList(dt) )
      .catchError((e) => throw Exception(e))
      .whenComplete(() => notifyListeners() );
    */
  }

  _read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${this._filename}');
      String text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
  }

  _saveGames() async {
    var json = jsonEncode(_listGames.map((e) => e.toJson()).toList());
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${this._filename}_games.json');
    await file.writeAsString(json);
    print('Games saved');
  }

  _saveTeams() async {
    var json = jsonEncode(_listTeams.map((e) => e.toJson()).toList());
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${this._filename}_teams.json');
    await file.writeAsString(json);
    print('Teams saved');
  }

}