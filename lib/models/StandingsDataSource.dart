import 'package:flutter/material.dart';
import 'package:wlt3/models/Standing.dart';
import 'package:wlt3/models/Standingdata.dart';

class StandingsDataSource extends DataTableSource {
  List<Standingdata> _standingdata;
  int _selectedCount = 0;

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

  List<DataCell> getDataCells(Standingdata standingdata)
  {
    List<DataCell> toret = [];
    if (standingdata.imgurl != null && standingdata.imgurl != '') toret.add(DataCell( Image.network(standingdata?.imgurl ?? '', width: 30, height: 30) ));
    toret.add(DataCell(Text('${standingdata.team}', 
        style: TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.bold,
            // fontSize: 12
          ),
        )
      )
    );
    toret.add(DataCell(Text('${standingdata.gp}')));
    toret.add(DataCell(Text('${standingdata.w}-${standingdata.l}-${standingdata.t}')));
    toret.add(DataCell(Text('${standingdata.pts}')));
    toret.add(DataCell(Text('${standingdata.gf}')));
    toret.add(DataCell(Text('${standingdata.ga}')));
    if (standingdata.pim != null) toret.add(DataCell(Text('${standingdata.pim}')));        // variable
    if (standingdata.gfavg != null) toret.add(DataCell(Text('${standingdata.gfavg}')));
    if (standingdata.plusminus != null) toret.add(DataCell(Text('${standingdata.plusminus}')));  // variable
    if (standingdata.rfavg != null) toret.add(DataCell(Text('${standingdata.rfavg}')));      // variable
    if (standingdata.strk != null) toret.add(DataCell(Text('${standingdata.strk}')));
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
      index: index,
      cells: getDataCells(standingdata),
    );
  }

  ///
  ///
  ///
  List<DataRow> getAllRows()
  {
    List<DataRow> toret = [];
    for (var i = 0; i < _standingdata.length; i++) toret.add(this.getRow(i));
    return toret;
  }


}
