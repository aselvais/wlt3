
import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Matchdates.dart';

class MatchdatesModel extends ChangeNotifier
{
  ApiaccessWlt _api = new ApiaccessWlt();  
  List<Matchdates> _list = new List();
  bool _loading = false;
  int _selectedId = -1;
  Matchdates _selectedModel;
  DateTime _selectedDate = DateTime.now();
   
  get list {
    return _list;
  }

  get selectedId {
    return _selectedId;
  }

  get loading {
    return _loading;
  }

  get selectedModel {
    return _selectedModel;
  }

  get selectedDate {
    return _selectedDate;
  }

  set selectedDate(DateTime v)
  {
    _selectedDate = v;
    notifyListeners();
  }
  
  set selectedModel(Matchdates v)
  {
    _selectedModel = v;
    notifyListeners();
  }
  
  set selectedId(int v)
  {
    _selectedId = v;
    notifyListeners();
  }

  set loading(bool v)
  {
    _loading = v;
    notifyListeners();
  }

  addToList(o)
  {
    _list.add(o);
    notifyListeners();
  }

  _replaceList(List<Matchdates> o)
  {
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  loadData(int seasonId, int divisionId)
  {
    this.loading = true;
    _list = new List();
    _api.getGameall(seasonId, divisionId)
      .then((dt) => _replaceList(dt) )
      .catchError((e) => throw Exception(e))
      .whenComplete(() => notifyListeners() );
    
  }

}