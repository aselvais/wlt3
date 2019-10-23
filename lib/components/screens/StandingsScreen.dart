import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListStandings.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class StandingsScreen extends StatelessWidget
{

  onTapTiers(BuildContext context)
  {
    final tiers = Provider.of<TiersModel>(context);
    final divisions = Provider.of<DivisionsModel>(context);
    tiers.loadData(divisions.selectedModel.id);
    Navigator.pushNamed(context, '/tiers');
  }

  @override
  Widget build(BuildContext context) {
    final tiers = Provider.of<TiersModel>(context);
    String tiersName = '...';
    try {
      tiersName = tiers.selectedModel.name;
    } catch(ee) {}
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: InkWell(
                  child: Column(
                    children: <Widget>[
                      Text('Tiers >', style: TextStyle( fontSize: 20, color: Colors.black ),),
                      Text(tiersName, style: TextStyle( fontSize: 15, color: Colors.black ),),
                    ],
                  ),
                  onTap: () => onTapTiers(context),
                ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.white,
                child: ListStandings(),
              ),
            )
        ],),
      )
      );

  }
  
}
