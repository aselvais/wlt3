

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/models/TeamModel.dart';

class ActionsComposite
{

  static goToTeamDetailScreen(BuildContext context, int teamId) 
  {
    final TeamModel teammodel = Provider.of<TeamModel>(context);
    teammodel.loadData(teamId);
    Navigator.pushNamed(context, '/teamdetail');
  }




}