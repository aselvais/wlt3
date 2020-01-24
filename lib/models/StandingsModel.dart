import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Standing.dart';

class StandingsModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Standing> _list = new List();
  bool _loading = false;
  int _selectedId = -1;
  Standing _selectedModel;

  ///
  ///
  ///
  get list {
    return _list;
  }

  ///
  ///
  ///
  get selectedId {
    return _selectedId;
  }

  ///
  ///
  ///
  get selectedModel {
    return _selectedModel;
  }

  ///
  ///
  ///
  get loading {
    return _loading;
  }

  ///
  ///
  ///
  set selectedId(int v) {
    _selectedId = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedModel(Standing v) {
    _selectedModel = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set loading(bool v) {
    _loading = v;
    notifyListeners();
  }

  ///
  ///
  ///
  addToList(o) {
    _list.add(o);
    notifyListeners();
  }

  ///
  ///
  ///
  _replaceList(List<Standing> o) {
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int divisionId, int tierId) async {
    if (divisionId < 0 || tierId < 0) return null;
    this.loading = true;
    _list = new List();
    await _api
        .getTeamstandingLocalTierGroupGeneric(divisionId, tierId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}
