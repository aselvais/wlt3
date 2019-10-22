import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';

class ListDivisions extends StatelessWidget {

  Widget getButton(BuildContext context, Division f)
  {
    final _list = Provider.of<DivisionsModel>(context);
    bool isSelected = false;
    if (_list.selectedId == f.id) isSelected = true;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Text(f.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 18.0)),
        ),
        Expanded(
          flex: 1,
          child: Icon(
              Icons.check,
              color: (isSelected) ? Colors.black : Colors.white,
              size: 24.0,
            ),
        ),
      ],
    );
  }

  onTapElement(BuildContext context, Division model)
  {
    final divisions = Provider.of<DivisionsModel>(context);
    final bottomModel = Provider.of<BottombarModel>(context);
    final games = Provider.of<GamesModel>(context);
    
    final seasons = Provider.of<SeasonsModel>(context);
    divisions.selectedId = model.id;
    divisions.selectedModel = model;
    games.loadData('2018-06-20', seasons.selectedModel.id, divisions.selectedModel.id);
    bottomModel.idx = 0;
     Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<DivisionsModel>(context);

    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (Division f) => wl.add(
          InkWell(
            child: Container(
              height: 60, 
              child: getButton(context, f),
            ),
            onTap: () => onTapElement(context, f),
          )
        )
      );
      return ListView(children: wl,);
    }


  }
}
