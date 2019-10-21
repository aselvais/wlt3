
import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/League.dart';

class LeaguesModel extends ChangeNotifier
{
  ApiaccessWlt _api = new ApiaccessWlt();  
  List<League> _list = new List();
  bool _loading = false;
  int _selectedId = -1;
  League _selectedModel;

  get list {
    return _list;
  }

  get selectedId {
    return _selectedId;
  }

  get selectedModel {
    return _selectedModel;
  }

  get loading {
    return _loading;
  }
  
  set selectedId(int v)
  {
    _selectedId = v;
    notifyListeners();
  }
  
  set selectedModel(League v)
  {
    _selectedModel = v;
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

  _replaceList(List<League> o)
  {
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  loadData()
  {
    if (_list.length == 0)
    {
      this.loading = true;
      _api.getLeagues()
        .then((dt) => _replaceList(dt) )
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners() );
    }
  }

}