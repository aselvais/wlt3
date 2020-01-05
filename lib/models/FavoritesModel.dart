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

  FavoritesModel()
  {
    this._read();
  }
  
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

  _read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      final fileGames = File('${directory.path}/${this._filename}_games.json');
      final fileTeams = File('${directory.path}/${this._filename}_teams.json');
      String jsonGames = await fileGames.readAsString();
      String jsonTeams = await fileTeams.readAsString();
      List _jsonGames = jsonDecode(jsonGames);
      List _jsonTeams = jsonDecode(jsonTeams);
      _listGames = _jsonGames.map((e) => Game.fromJson(e)).toList();
      _listTeams = _jsonTeams.map((e) => Team.fromJson(e)).toList();
    } catch (e) {
      print("Couldn't read file and process file");
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