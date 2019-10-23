import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/Standing.dart';

class ListStandings extends StatelessWidget {

  Widget getElement(BuildContext context, Standingdata f, String k)
  {
    try {
      switch(k) {
        case 'imgurl': { return Image.network(f.imgurl); }
        break;
        case 'team': { return Text('team: ' + f.team); }
        break;
        case 'gp': { return Text('teamId: ' + f.teamId.toString()); }
        break;
        case 'gp': { return Text('GP: ' + f.gp.toString()); }
        break;
        case 'w': { return Text('W: ' + f.w.toString()); }
        break;
        case 'l': { return Text('L: ' + f.l.toString()); }
        break;
        case 't': { return Text('T: ' + f.t.toString()); }
        break;
        case 'pts': { return Text('PTS: ' + f.pts.toString()); }
        break;
        case 'gf': { return Text('GF: ' + f.gf.toString()); }
        break;
        case 'ga': { return Text('GA: ' + f.ga.toString()); }
        break;
        case 'gfavg': { return Text('GFAVG: ' + f.gfavg.toString()); }
        break;
        case 'strk': { return Text('STRK: ' + f.strk); }
        break;
        default: { return Text(k + ' INVALID!'); }
        break;
      }

    } catch(ee) { 
      return Text(k + ' ERROR!'); 
    }
  }


  List<Widget> getRow(BuildContext context, List<Standingdata> f)
  {
    List<Widget> toret = new List();
    f.forEach( (Standingdata f) => toret.add(
      Column(children: <Widget>[
        Text('----------------------------'),
        this.getElement(context, f, 'imgurl'),
        Text('----------------------------'),
        this.getElement(context, f, 'team'),
        this.getElement(context, f, 'teamId'),
        this.getElement(context, f, 'gp'),
        this.getElement(context, f, 'w'),
        this.getElement(context, f, 'l'),
        this.getElement(context, f, 't'),
        this.getElement(context, f, 'pts'),
        this.getElement(context, f, 'gf'),
        this.getElement(context, f, 'ga'),
        this.getElement(context, f, 'gfavg'),
        this.getElement(context, f, 'strk'),
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
