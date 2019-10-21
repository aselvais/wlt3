
import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Division.dart';

class GamesModel extends ChangeNotifier
{
  ApiaccessWlt _api = new ApiaccessWlt();  
  List<Division> _list = new List();
  bool _loading = false;
  int _selectedId = -1;
  Division _selectedModel;

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

  set selectedModel(Division v)
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

  _replaceList(List<Division> o)
  {
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  loadData(int seasonId)
  {
    this.loading = true;
    _list = new List();
    _api.getDivisions(seasonId)
      .then((dt) => _replaceList(dt) )
      .catchError((e) => throw Exception(e))
      .whenComplete(() => notifyListeners() );
  }

}