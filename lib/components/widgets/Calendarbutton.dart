import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/FormaterElem.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'dart:async';

class Calendarbutton extends StatelessWidget 
{

  Future<void> _selectDate(BuildContext context) async 
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final MatchdatesModel matchdates = Provider.of<MatchdatesModel>(context);
    List<DateTime> availableDates = matchdates.getListOfAvailableDates();
    DateTime firstDate = DateTime(2016);
    DateTime lastDate = DateTime(2025);
    DateTime initialDate = games.selectedDate;
    Function selectableDayPredicate;
    if (availableDates.length > 0)
    {
      try { firstDate = availableDates[0]; } catch (ee) {}
      try { lastDate = availableDates[availableDates.length-1]; } catch (ee) {}
      if (initialDate.isBefore(firstDate) || initialDate.isAfter(lastDate) )
      {
        initialDate = firstDate;
      }
      selectableDayPredicate = (s) => (availableDates.indexOf(s) < 0) ? false : true;
    }
    try {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        selectableDayPredicate: selectableDayPredicate
      );

      if (picked != null && picked != games.selectedDate) 
      {
        games.selectedDate = picked;
        ActionsComposite.reloadGamesData(context);
      }
    } catch (ee) {}

  }

  onTapDate(BuildContext context) 
  {
    _selectDate(context);
  }

  onTapNavButton(BuildContext context, bool right) 
  {
    final GamesModel games = Provider.of<GamesModel>(context);
    final matchdatesModel = Provider.of<MatchdatesModel>(context);
    games.selectedDate = matchdatesModel.getClosestDate(games.selectedDate, right, false);
    ActionsComposite.reloadGamesData(context);
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
              child: Text( FormaterElem.getDateFormated(games.selectedDate.toString(), false),
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
