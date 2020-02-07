import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsModel.dart';

///
///
///
class ListStandingsTables extends StatelessWidget {

  ///
  ///
  ///
  Widget getRow(BuildContext context, List<Standingdata> _standingdata, Standingdata _standingdataFirstLine, bool isLandscape, String title)
  {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(height: 3,fontWeight: FontWeight.bold,fontSize: 16)),
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
                          columns: 
                          [
                            (_standingdataFirstLine.imgurl != null && _standingdataFirstLine.imgurl != '') ? (DataColumn( label: Text(''.toUpperCase()), )) : null,
                            DataColumn( label: Text('team'.toUpperCase())),
                            DataColumn( label: Text('gp'.toUpperCase())),
                            DataColumn( label: Text('w-l-t'.toUpperCase())),
                            DataColumn( label: Text('pts'.toUpperCase())),
                            (isLandscape == true) ? (DataColumn( label: Text('gf'.toUpperCase()), )) : null,
                            (isLandscape == true) ? (DataColumn( label: Text('ga'.toUpperCase()), )) : null, 
                            (isLandscape == true && _standingdataFirstLine.pim != null) ? (DataColumn( label: Text('pim'.toUpperCase()), )) : null, 
                            (isLandscape == true && _standingdataFirstLine.gfavg != null) ? (DataColumn( label: Text('gfavg'.toUpperCase()), )) : null, 
                            (isLandscape == true && _standingdataFirstLine.plusminus != null) ? (DataColumn( label: Text('plusminus'.toUpperCase()), )) : null, 
                            (isLandscape == true && _standingdataFirstLine.rfavg != null) ? (DataColumn( label: Text('rfavg'.toUpperCase()), )) : null, 
                            (isLandscape == true && _standingdataFirstLine.strk != null) ? (DataColumn( label: Text('strk'.toUpperCase()), )) : null, 
                          ].where((t) => t != null).toList(),
                          rows: _standingdata.map((standingdata) => DataRow(
                                cells: [
                                  (standingdata.imgurl != null && standingdata.imgurl != '') ? (DataCell( Image.network(standingdata?.imgurl ?? '', width: 30, height: 30), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId) )) : null,
                                  (DataCell(Text('${standingdata.team}',  overflow: TextOverflow.ellipsis, style: TextStyle( fontWeight: FontWeight.bold, ),), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId) ) ),
                                  (DataCell(Text('${standingdata.gp}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId) )),
                                  (DataCell(Text('${standingdata.w}-${standingdata.l}-${standingdata.t}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))),
                                  (DataCell(Text('${standingdata.pts}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))),

                                  (isLandscape == true) ? (DataCell(Text('${standingdata.gf}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,
                                  (isLandscape == true) ? (DataCell(Text('${standingdata.ga}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,

                                  (isLandscape == true && standingdata.pim != null) ? (DataCell(Text('${standingdata.pim}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,
                                  (isLandscape == true && standingdata.gfavg != null) ? (DataCell(Text('${standingdata.gfavg.toStringAsPrecision(4)}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,
                                  (isLandscape == true && standingdata.plusminus != null) ? (DataCell(Text('${standingdata.plusminus}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,
                                  (isLandscape == true && standingdata.rfavg != null) ? (DataCell(Text('${standingdata.rfavg}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,
                                  (isLandscape == true && standingdata.strk != null) ? (DataCell(Text('${standingdata.strk}'), onTap: () => ActionsComposite.goToTeamDetailScreen(context, standingdata.teamId))) : null,

                                ].where((t) => t != null).toList(),
                          )
                          ).toList(),
                      )
                    ))
              ],),
      ],
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) 
  {
    if (ActionsComposite.isLoading(context) == true) return Center(child: CircularProgressIndicator());
    else 
    {
      bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
      StandingsModel _standingsModel = Provider.of<StandingsModel>(context);
      return Column(children: _standingsModel.list.map((_standing) => getRow(
          context, 
          _standing.data, 
          _standing.data.first, 
          isLandscape, 
          (_standing.title != '' && _standing.title != null) ? _standing.title : '')
      ).toList());
    }
  }


}
