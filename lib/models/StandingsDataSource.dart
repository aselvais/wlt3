import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';

class StandingsDataSource extends DataTableSource {
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

  _onTap(teamId)
  {
    ActionsComposite.goToTeamDetailScreen(_context, teamId);
  }

  List<DataCell> getDataCells(Standingdata standingdata)
  {
    List<DataCell> toret = [];
    if (standingdata.imgurl != null && standingdata.imgurl != '') toret.add(DataCell( Image.network(standingdata?.imgurl ?? '', width: 30, height: 30), onTap: () => this._onTap(standingdata.teamId) ));
    toret.add(DataCell(Text('${standingdata.team}',  overflow: TextOverflow.ellipsis, style: TextStyle( fontWeight: FontWeight.bold, ),), onTap: () => this._onTap(standingdata.teamId) ) );
    toret.add(DataCell(Text('${standingdata.gp}'), onTap: () => this._onTap(standingdata.teamId) ));
    toret.add(DataCell(Text('${standingdata.w}-${standingdata.l}-${standingdata.t}'), onTap: () => this._onTap(standingdata.teamId)));
    toret.add(DataCell(Text('${standingdata.pts}'), onTap: () => this._onTap(standingdata.teamId)));

    if (this.isLandscape == true)
    {
      toret.add(DataCell(Text('${standingdata.gf}'), onTap: () => this._onTap(standingdata.teamId)));
      toret.add(DataCell(Text('${standingdata.ga}'), onTap: () => this._onTap(standingdata.teamId)));
      if (standingdata.pim != null) toret.add(DataCell(Text('${standingdata.pim}'), onTap: () => this._onTap(standingdata.teamId)));        // variable
      if (standingdata.gfavg != null) toret.add(DataCell(Text('${standingdata.gfavg.toStringAsPrecision(4)}'), onTap: () => this._onTap(standingdata.teamId)));
      if (standingdata.plusminus != null) toret.add(DataCell(Text('${standingdata.plusminus}'), onTap: () => this._onTap(standingdata.teamId)));  // variable
      if (standingdata.rfavg != null) toret.add(DataCell(Text('${standingdata.rfavg}'), onTap: () => this._onTap(standingdata.teamId)));      // variable
      if (standingdata.strk != null) toret.add(DataCell(Text('${standingdata.strk}'), onTap: () => this._onTap(standingdata.teamId)));
    }

    return toret;
  }

  ///
  ///
  ///
  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _standingdata.length) return null;
    final Standingdata standingdata = _standingdata[index];
    return DataRow.byIndex(
      /*
      onSelectChanged: (bool selected) {
        if (selected) {
            print('row-selected: (${standingdata.teamId}) ${standingdata.team}');
        }
      },
      */
      index: index,
      cells: getDataCells(standingdata),
    );
  }

  ///
  ///
  ///
  List<DataRow> getAllRows(BuildContext context)
  {
    this.isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    this._context = context;
    List<DataRow> toret = [];
    for (var i = 0; i < _standingdata.length; i++) toret.add(this.getRow(i));
    return toret;
  }


}
