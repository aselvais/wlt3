import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'dart:async';

class Calendarbutton extends StatelessWidget 
{

  Future<void> _selectDate(BuildContext context) async 
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: games.selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != games.selectedDate) 
    {
      games.selectedDate = picked;
      reloadData(context);
    }
  }

  reloadData(BuildContext context)
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final Season season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division division = Provider.of<DivisionsModel>(context).selectedModel;
    games.loadData(season.id, division.id);
  }

  onTapDate(BuildContext context) 
  {
    _selectDate(context);
  }

  onTapNavButton(BuildContext context, bool right) 
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final matchdatesModel = Provider.of<MatchdatesModel>(context);
    games.selectedDate = matchdatesModel.getClosestDate(games.selectedDate, right);
    reloadData(context);
  }

  getNavButton(BuildContext context, bool right) 
  {
    return Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment(0.0, 0.0),
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            child: InkWell(
              child: Icon(right ? Icons.chevron_right : Icons.chevron_left),
              onTap: () => onTapNavButton(context, right),
            )));
  }

  getCalendarButton(BuildContext context) 
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    return Expanded(
        flex: 8,
        child: Container(
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            alignment: Alignment(0.0, 0.0),
            child: InkWell(
              child: Text(DateFormat.yMMMd().format(games.selectedDate),
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () => onTapDate(context),
            )));
  }

  @override
  Widget build(BuildContext context) 
  {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          getNavButton(context, false),
          getCalendarButton(context),
          getNavButton(context, true),
        ],
      ),
    );
  }

}
