import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'dart:async';

class Calendarbutton extends StatelessWidget {
  Future<void> _selectDate(BuildContext context) async {
    final GamesModel games = Provider.of<GamesModel>(context);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: games.selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != games.selectedDate) {
      final Season season = Provider.of<SeasonsModel>(context).selectedModel;
      final Division division =
          Provider.of<DivisionsModel>(context).selectedModel;
      games.selectedDate = picked;
      games.loadData(season.id, division.id);
    }
  }

  onTapDate(BuildContext context) {
    _selectDate(context);
    // Navigator.pushNamed(context, '/pickdate');
  }

  @override
  Widget build(BuildContext context) {
    final GamesModel games = Provider.of<GamesModel>(context);
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
            alignment: Alignment(0.0, 0.0),
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            child: Icon(Icons.chevron_left),
          )),
          Expanded(
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
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
            alignment: Alignment(0.0, 0.0),
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            child: Icon(Icons.chevron_right),
          )),
        ],
      ),
    );

    /*
    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(5.0),
      color: Themedata.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 9,
              child: Column(
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.subtitle.toUpperCase(),
                    style: TextStyle(
                      color: Themedata.blue,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
    */
  }
}
