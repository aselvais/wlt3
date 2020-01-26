import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListStandings.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/components/widgets/NewsElement.dart';
import 'package:wlt3/components/widgets/TweetsElement.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/Gamesdata.dart';
import 'package:wlt3/models/News.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Tweet.dart';
import 'package:wlt3/components/LoadingStatusWidget.dart';

class TeamdetailScreen extends LoadingStatusWidget {
  ///
  ///
  ///
  Widget getPreviousGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.past.forEach((Game f) => wl.add(GameElement(game: f)));
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
  Widget getTodaysGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.today.forEach((Game f) => wl.add(GameElement(game: f)));
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
  Widget getFutureGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.upcoming.forEach((Game f) => wl.add(GameElement(game: f)));
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
  Widget getStandings(BuildContext context, TeamModel teams) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Themedata.greyBackground,
      child: ListStandings(),
    );
  }

  ///
  ///
  ///
  Widget getNews(BuildContext context, TeamModel teams) {
    final List<News> news = teams.selectedModel.news;
    List<Widget> wl = new List();
    news.forEach((News f) => wl.add(NewsElement(news: f)));
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
  Widget getTweets(BuildContext context, TeamModel teams) {
    final List<Tweet> tweets = teams.selectedModel.tweets;
    List<Widget> wl = new List();
    tweets.forEach((Tweet f) => wl.add(TweetsElement(tweet: f)));
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
  Widget getTabsView(BuildContext context, TeamModel teams) {
    int gamesPastLength = 0;
    int gamesTodayLength = 0;
    int gamesUpcomingLength = 0;
    int standingsLength = 1;
    int newsLength = 0;
    int tweetsLength = 0;
    List<Widget> headerWidgets = [];
    List<Widget> contentWidget = [];
    try {
      gamesPastLength = teams.selectedModel.games.past.length;
    } catch (ee) {}
    try {
      gamesTodayLength = teams.selectedModel.games.today.length;
    } catch (ee) {}
    try {
      gamesUpcomingLength = teams.selectedModel.games.past.upcoming;
    } catch (ee) {}
    try {
      newsLength = teams.selectedModel.news.length;
    } catch (ee) {}
    try {
      tweetsLength = teams.selectedModel.tweets.length;
    } catch (ee) {}
    /* ------------------------------------------------------- */
    if (gamesPastLength > 0) {
      headerWidgets.add(Tab(
        text: 'Previous Games',
      ));
      contentWidget.add(getPreviousGames(context, teams));
    }
    if (gamesTodayLength > 0) {
      headerWidgets.add(Tab(
        text: 'Today\'s Games',
      ));
      contentWidget.add(getTodaysGames(context, teams));
    }
    if (gamesUpcomingLength > 0) {
      headerWidgets.add(Tab(
        text: 'Future Games',
      ));
      contentWidget.add(getFutureGames(context, teams));
    }
    if (standingsLength > 0) {
      headerWidgets.add(Tab(
        text: 'Standings',
      ));
      contentWidget.add(getStandings(context, teams));
    }
    if (newsLength > 0) {
      headerWidgets.add(Tab(
        text: 'News',
      ));
      contentWidget.add(getNews(context, teams));
    }
    if (tweetsLength > 0) {
      headerWidgets.add(Tab(
        text: 'Tweets',
      ));
      contentWidget.add(getTweets(context, teams));
    }

    /* ------------------------------------------------------- */
    return Expanded(
      flex: 7,
      child: DefaultTabController(
        length: contentWidget.length,
        child: Scaffold(
          appBar: new PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppBar(
                automaticallyImplyLeading: false,
                // backgroundColor: Colors.black,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: headerWidgets,
                ),
              )),
          body: TabBarView(
            children: contentWidget,
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getButtons(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'Past Games',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'Standings',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'News',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getBodyElement(BuildContext context, TeamModel teams) {
    final Team team = teams.selectedModel.teaminfo;
    return Expanded(
      flex: 7,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Text(
            team.teamName, // _title,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getButton(
      BuildContext context, IconData ico, String label, action, icocolor) {
    return Container(
      alignment: Alignment(0.0, -1.0),
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(ico, color: icocolor),
          ],
        ),
        onTap: action,
      ),
    );
  }

  ///
  ///
  ///
  onTapFavorite(BuildContext context) {
    final teams = Provider.of<TeamModel>(context);
    final Team team = teams.selectedModel.teaminfo;
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    favorites.addToListTeams(team);
  }

  ///
  ///
  ///
  Widget getHeaderElement(BuildContext context, TeamModel teams) {
    final Team team = teams.selectedModel.teaminfo;
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    bool isInFavorite = favorites.isInTeamsFavorite(team.teamId);
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(''),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: <Widget>[
                    Image.network(team?.imageUrl ?? "", width: 70, height: 70),
                    Text(team.teamName + " | " + team.divisionName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    Text(
                        team.win.toString() +
                            '-' +
                            team.lose.toString() +
                            '-' +
                            team.draw.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: (isInFavorite
                    ? this.getButton(context, Icons.star, 'FAVORITE',
                        () => null, Colors.yellow)
                    : this.getButton(context, Icons.star_border, 'FAVORITE',
                        () => onTapFavorite(context), Colors.white)),
              ),
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
      title: new Text('Team detail'),
      backgroundColor: Colors.black,
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<TeamModel>(context);
    if (this.isLoading(context) == true) {
      return this.getLoadingWidget(context);
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarElement(context),
        body: Column(
          children: <Widget>[
            getHeaderElement(context, teams),
            //getBodyElement(context, team),
            getTabsView(context, teams)
          ],
        ),
      );
    }
  }
}
