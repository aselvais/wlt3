import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  List<Matchdates> get list 
  {
    return _list;
  }

  get selectedId 
  {
    return _selectedId;
  }

  get loading 
  {
    return _loading;
  }

  get selectedModel 
  {
    return _selectedModel;
  }

  get selectedDate 
  {
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
    _api
        .getGameall(seasonId, divisionId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }

  List<DateTime> getListOfAvailableDates()
  {
    List<String> alldates = new List();
    List<DateTime> alldatestime = new List();
    for (int i = 0; i < this.list.length; i++) 
    {
      alldates.add(DateFormat("yyyy-MM-dd").format(this.list[i].dateTimeReal));
    }
    alldates = alldates.toSet().toList();
    alldates.sort();
    for (int i = 0; i < alldates.length; i++) 
    {
      alldatestime.add(DateTime.parse(alldates[i]));
    }
    return alldatestime;
  }

  DateTime getClosestDate(DateTime fromDate, bool right, bool allowCurrent) 
  {
    bool isPresent = true;
    List<String> alldates = new List();
    String fromDateStr = new DateFormat("yyyy-MM-dd").format(fromDate);
    for (int i = 0; i < this.list.length; i++) 
    {
      alldates.add(DateFormat("yyyy-MM-dd").format(this.list[i].dateTimeReal));
    }
    if (alldates.indexOf(fromDateStr) == -1) 
    {
      isPresent = false;
    }
    alldates.add(fromDateStr);
    alldates = alldates.toSet().toList();
    alldates.sort();
    // isPresent; // print(alldates); // print(right);
    int dateIdx = alldates.indexOf(fromDateStr);
    int newIdx = right ? dateIdx + 1 : dateIdx - 1;
    if (allowCurrent == true && isPresent == true)
    {
      newIdx =  dateIdx;
    }
    if (newIdx == alldates.length) 
    {
      return DateTime.parse(alldates[alldates.length - 1]);
    } 
    else if (newIdx < 0) 
    {
      return DateTime.parse(alldates[0]);
    } 
    else 
    {
      return DateTime.parse(alldates[newIdx]);
    }
  }


}
