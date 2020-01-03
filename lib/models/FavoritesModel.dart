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
    print('-------------------------');
    print('FavoritesModel.addToListGames()');
    print(o.toJson());
    _listGames.add(o);
    print('-------------------------');
    notifyListeners();
  }

  addToListTeams(Team o)
  {
    print('-------------------------');
    print('FavoritesModel.addToListTeams()');
    print(o.toJson());
    _listTeams.add(o);
    print('-------------------------');
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
      final file = File('${directory.path}/wlt3fluter.json');
      String text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
  }

  _save(data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/wlt3fluter.json');
    final text = 'Hello World!';
    await file.writeAsString(text);
    print('saved');
  }

}