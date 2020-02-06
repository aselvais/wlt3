import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListStandingsTables.dart';
import 'package:wlt3/components/widgets/Buttonlist.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/TiersModel.dart';

class StandingsScreen extends StatelessWidget {
  ///
  ///
  ///
  onTapTiers(BuildContext context) {
    ActionsComposite.goToTiersScreen(context);
  }

  ///
  ///
  ///
  Widget getTiersButton(BuildContext context) {
    final tiers = Provider.of<TiersModel>(context);
    String tiersName = '...';
    try {
      tiersName = tiers.selectedModel.name;
    } catch (ee) {}
    if (tiers.loading == true || tiers.list.length == 0) {
      return Container();
    } else {
      return Expanded(
        flex: 1,
        child: InkWell(
          child: Buttonlist(
            title: 'Tiers',
            subtitle: tiersName,
          ),
          onTap: () => onTapTiers(context),
        ),
      );
    }
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themedata.greyBackground,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              getTiersButton(context),
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: ListStandingsTables(),
                ),
              )
            ],
          ),
        ));
  }
}
