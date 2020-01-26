import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/components/widgets/TeamElement.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class FavoritesScreen extends LoadingStatusWidget {
  ///
  ///
  ///
  Widget getTeams(BuildContext context) {
    final favorites = Provider.of<FavoritesModel>(context);
    List<Widget> wl = new List();
    favorites.listTeams.forEach((Team f) => wl.add(TeamElement(team: f)));
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
          children: wl,
        ));
  }

  ///
  ///
  ///
  Widget getGames(BuildContext context) {
    final favorites = Provider.of<FavoritesModel>(context);
    List<Widget> wl = new List();
    favorites.listGames.forEach((Game f) => wl.add(GameElement(game: f)));
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
          children: wl,
        ));
  }

  ///
  ///
  ///
  Widget getTabsView(BuildContext context) {
    return Expanded(
      flex: 7,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Teams',
                  ),
                  Tab(
                    text: 'Games',
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              getTeams(context),
              getGames(context),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getAppBarElement(BuildContext context) {
    return AppBar(
      title: new Text('Favorites'),
      backgroundColor: Colors.black,
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesModel>(context);
    if (this.isLoading(context) == true) {
      return this.getLoadingWidget(context);
    } else {
      return Column(
        children: <Widget>[getTabsView(context)],
      );
      /*
      return Scaffold(
        backgroundColor: Colors.white,
        //appBar: getAppBarElement(context),
        body: Column(
          children: <Widget>[
            getTabsView(context)
          ],
        ),
      );
      */
    }
  }
}
