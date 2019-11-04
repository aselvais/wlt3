import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/components/widgets/NewsElement.dart';
import 'package:wlt3/components/widgets/TweetsElement.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/Gamesdata.dart';
import 'package:wlt3/models/News.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Tweet.dart';

class TeamdetailScreen extends StatelessWidget {

  Widget getPreviousGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.past.forEach((Game f) => wl.add(GameElement(game: f)));
    return Container(
      color: Colors.white,
      child: ListView(children: wl,)
      // Text('Number of games: ' + gamesdata.past.length.toString()),
    );
  }

  Widget getTodaysGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.today.forEach((Game f) => wl.add(GameElement(game: f)));
    return Container(
      color: Colors.white,
      child: ListView(children: wl,) // Text('Number of games: ' + gamesdata.today.length.toString()),
    );
  }

  Widget getFutureGames(BuildContext context, TeamModel teams) {
    final Gamesdata gamesdata = teams.selectedModel.games;
    List<Widget> wl = new List();
    gamesdata.upcoming.forEach((Game f) => wl.add(GameElement(game: f)));
    return Container(
      color: Colors.white,
      child: ListView(children: wl,) // Text('Number of games: ' + gamesdata.upcoming.length.toString()),
    );
  }

  Widget getStandings(BuildContext context, TeamModel teams) {
    return Container(color: Colors.white,);
  }

  Widget getNews(BuildContext context, TeamModel teams) {
    final List<News> news = teams.selectedModel.news;
    List<Widget> wl = new List();
    wl.add(Text('Number of new: ' + news.length.toString()));
    news.forEach((News f) => wl.add(NewsElement(news: f)));
    return Container(
      color: Colors.white,
      child: ListView(children: wl,)
    );
  }

  Widget getTweets(BuildContext context, TeamModel teams) {
    final List<Tweet> tweets = teams.selectedModel.tweets;
    List<Widget> wl = new List();
    wl.add(Text('Number of tweets: ' + tweets.length.toString()));
    tweets.forEach((Tweet f) => wl.add( TweetsElement(tweet: f)));
    return Container(
      color: Colors.white,
      child: ListView(children: wl,)
    );

    /*
    return Container(
      color: Colors.white,
      child: Text('Number of tweets: ' + tweets.length.toString()),
    );
    */

  }

  Widget getTabsView(BuildContext context, TeamModel teams) {
    return Expanded(
      flex: 7,
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.black,
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'Previous Games',
                ),
                Tab(
                  text: 'Today\'s Games',
                ),
                Tab(
                  text: 'Future Games',
                ),
                Tab(
                  text: 'Standings',
                ),
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'Tweets',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              getPreviousGames(context, teams),
              getTodaysGames(context, teams),
              getFutureGames(context, teams),
              getStandings(context, teams),
              getNews(context, teams),
              getTweets(context, teams),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget getHeaderElement(BuildContext context, TeamModel teams) {
    final Team team = teams.selectedModel.teaminfo;
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(team.imageUrl, width: 70, height: 70),
              Text(team.teamName + " | " + team.divisionName,
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
      ),
    );
  }

  Widget getAppBarElement(BuildContext context) {
    return AppBar(
      title: new Text('Team detail'),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<TeamModel>(context);
    if (teams.loading == true) {
      return Center(child: CircularProgressIndicator());
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
