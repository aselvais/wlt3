import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';

class ListSeasons extends StatelessWidget {

  Widget getButton(BuildContext context, Season f)
  {
    final _list = Provider.of<SeasonsModel>(context);
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



  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<SeasonsModel>(context);

    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (Season f) => wl.add(
          InkWell(
            child: Container(
              height: 60, 
              child: getButton(context, f),
            ),
            onTap: () => _list.selectedId = f.id,
          )
        )
      );
      return ListView(children: wl,);
    }


  }
}
