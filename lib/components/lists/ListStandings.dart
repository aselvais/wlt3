import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/Standing.dart';

class ListStandings extends StatelessWidget {

  List<Widget> getRow(BuildContext context, List<Standingdata> f)
  {
    List<Widget> toret = new List();
    f.forEach( (Standingdata f) => toret.add(
      Column(children: <Widget>[
        Text('----------------------------'),
        Image.network(f.imgurl),
        Text('team: ' + f.team),
        Text('teamId: ' + f.teamId.toString()),
        Text('GP: ' + f.gp.toString()),
        Text('W: ' + f.w.toString()),
        Text('L: ' + f.l.toString()),
        Text('T: ' + f.t.toString()),
        Text('PTS: ' + f.pts.toString()),
        Text('GF: ' + f.gf.toString()),
        Text('GA: ' + f.ga.toString()),
        Text('GFAVG: ' + f.gfavg.toString()),
        Text('STRK: ' + f.strk),
      ],)
    ));
    //f.forEach( (Standingdata f) => print(f.teamId));
    return toret;
  }

  Widget getButton(BuildContext context, Standing f)
  {
    return Column( children:getRow(context, f.data) );
  }

  onTapElement(BuildContext context, Standing model)
  {
  }

  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<StandingsModel>(context);

    List<Widget> wl = new List();
    if (_list.loading == true)
    {
      return Center(child:CircularProgressIndicator());
    } else {
      _list.list.forEach(
        (Standing f) => wl.add(
          InkWell(
            child: Container(
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
