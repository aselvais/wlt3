import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/Tiers.dart';
import 'package:wlt3/models/TiersModel.dart';

class ListTiers extends StatelessWidget {

  Widget getButton(BuildContext context, Tiers f)
  {
    final _list = Provider.of<TiersModel>(context);
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

  onTapElement(BuildContext context, Tiers model)
  {
    final tiers = Provider.of<TiersModel>(context);
    final bottomModel = Provider.of<BottombarModel>(context);
    tiers.selectedId = model.id;
    tiers.selectedModel = model;
    bottomModel.idx = 1;
    
    final standing = Provider.of<StandingsModel>(context);
    final divisions = Provider.of<DivisionsModel>(context);
    standing.loadData(divisions.selectedModel.id, tiers.selectedModel.id);

    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<TiersModel>(context);

    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (Tiers f) => wl.add(
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
