import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsDataSource.dart';
import 'package:wlt3/models/StandingsModel.dart';


class ListStandingsTables extends StatelessWidget {

  ///
  ///
  ///
  List<DataColumn> getHeaderColumns(BuildContext context, Standingdata h)
  {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    List<DataColumn> toret = [];
    if (h.imgurl != null && h.imgurl != '') toret.add(DataColumn( label: Text(''.toUpperCase()), ));
    toret.add(DataColumn( label: Text('team'.toUpperCase()), ));
    toret.add(DataColumn( label: Text('gp'.toUpperCase()), ));
    toret.add(DataColumn( label: Text('w-l-t'.toUpperCase()), ));
    toret.add(DataColumn( label: Text('pts'.toUpperCase()), ));
    if (isLandscape == true)
    {
      toret.add(DataColumn( label: Text('gf'.toUpperCase()), ));
      toret.add(DataColumn( label: Text('ga'.toUpperCase()), ));
      if (h.pim != null) toret.add(DataColumn( label: Text('pim'.toUpperCase()), ));        // variable
      if (h.gfavg != null) toret.add(DataColumn( label: Text('gfavg'.toUpperCase()), ));
      if (h.plusminus != null) toret.add(DataColumn( label: Text('plusminus'.toUpperCase()), ));  // variable
      if (h.rfavg != null) toret.add(DataColumn( label: Text('rfavg'.toUpperCase()), ));      // variable
      if (h.strk != null) toret.add(DataColumn( label: Text('strk'.toUpperCase()), ));
    }
    return toret;
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    StandingsModel _standingsModel = Provider.of<StandingsModel>(context);
    if (_standingsModel.loading == true) return Center(child: CircularProgressIndicator());
    else 
    {
      List<Widget> _tables = <Widget>[];
      for(var i = 0; i < _standingsModel.list.length; i++)
      {
        StandingsDataSource _standingsDataSource = StandingsDataSource(_standingsModel.list[i].data);
        
        if (_standingsModel.list[i].title != '' && _standingsModel.list[i].title != null) 
        {
          _tables.add(Text(_standingsModel.list[i].title,
            style: TextStyle(
                height: 3,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
          ));
        }

        _tables.add(
          Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                    child: DataTable(
                      columnSpacing: 0,
                      dataRowHeight: 30,
                      columns: getHeaderColumns(context, _standingsModel.list[i].data.first),
                      rows: _standingsDataSource.getAllRows(context),
                  )
                ))
          ],)
        );
      }
      return Column(children: _tables);
    }
  }


}
