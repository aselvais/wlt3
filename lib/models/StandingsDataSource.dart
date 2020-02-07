import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';

class StandingsDataSource {
  List<Standingdata> _standingdata;
  int _selectedCount = 0;
  bool isLandscape = false;
  BuildContext _context;

  ///
  ///
  ///
  StandingsDataSource(List<Standingdata> d) {
    _standingdata = d;
  }

  ///
  ///
  ///
  @override
  int get rowCount {
    return _standingdata.length;
  }

  ///
  ///
  ///
  @override
  bool get isRowCountApproximate {
    return false;
  }

  ///
  ///
  ///
  @override
  int get selectedRowCount {
    return _selectedCount;
  }

  ///
  ///
  ///
  _onTap(teamId) async
  {
    await ActionsComposite.goToTeamDetailScreen(_context, teamId);
  }

  ///
  ///
  ///
  DataRow getRow(Standingdata standingdata, int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        (standingdata.imgurl != null && standingdata.imgurl != '') ? (DataCell( Image.network(standingdata?.imgurl ?? '', width: 30, height: 30), onTap: () => this._onTap(standingdata.teamId) )) : null,
        (DataCell(Text('${standingdata.team}',  overflow: TextOverflow.ellipsis, style: TextStyle( fontWeight: FontWeight.bold, ),), onTap: () => this._onTap(standingdata.teamId) ) ),
        (DataCell(Text('${standingdata.gp}'), onTap: () => this._onTap(standingdata.teamId) )),
        (DataCell(Text('${standingdata.w}-${standingdata.l}-${standingdata.t}'), onTap: () => this._onTap(standingdata.teamId))),
        (DataCell(Text('${standingdata.pts}'), onTap: () => this._onTap(standingdata.teamId))),

        (this.isLandscape == true) ? (DataCell(Text('${standingdata.gf}'), onTap: () => this._onTap(standingdata.teamId))) : null,
        (this.isLandscape == true) ? (DataCell(Text('${standingdata.ga}'), onTap: () => this._onTap(standingdata.teamId))) : null,

        (this.isLandscape == true && standingdata.pim != null) ? (DataCell(Text('${standingdata.pim}'), onTap: () => this._onTap(standingdata.teamId))) : null,
        (this.isLandscape == true && standingdata.gfavg != null) ? (DataCell(Text('${standingdata.gfavg.toStringAsPrecision(4)}'), onTap: () => this._onTap(standingdata.teamId))) : null,
        (this.isLandscape == true && standingdata.plusminus != null) ? (DataCell(Text('${standingdata.plusminus}'), onTap: () => this._onTap(standingdata.teamId))) : null,
        (this.isLandscape == true && standingdata.rfavg != null) ? (DataCell(Text('${standingdata.rfavg}'), onTap: () => this._onTap(standingdata.teamId))) : null,
        (this.isLandscape == true && standingdata.strk != null) ? (DataCell(Text('${standingdata.strk}'), onTap: () => this._onTap(standingdata.teamId))) : null,

      ].where((t) => t != null).toList(),
    );
  }

  ///
  ///
  ///
  List<DataRow> getAllRows(BuildContext context)
  {
    this.isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    this._context = context;
    int u = 0;
    return _standingdata.map((i) => this.getRow(i, u++)).toList();
  }


}
