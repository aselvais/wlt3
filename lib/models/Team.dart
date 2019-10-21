class Team {

  final int teamId;
  final String teamName;
  final String imageUrl;
  final int score;
  final bool news;
  final bool tweets;
  final bool home;
  final int win;
  final int lose;
  final int draw;
  final int shootoutLoss;
  final bool enableSol;
  final int streak;
  final int positionElementInStandings;

  Team({this.teamId, this.teamName, this.imageUrl, this.score, this.news, this.tweets, 
        this.home, this.win, this.lose, this.draw, this.shootoutLoss,
        this.enableSol, this.streak, this.positionElementInStandings});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        teamId: json['teamId'],
        teamName: json['teamName'],
        imageUrl: json['imageUrl'],
        score: json['score'],
        news: json['news'],
        tweets: json['tweets'],
        home: json['home'],
        win: json['win'],
        lose: json['lose'],
        draw: json['draw'],
        shootoutLoss: json['shootoutLoss'],
        enableSol: json['enableSol'],
        streak: json['streak'],
        positionElementInStandings: json['positionElementInStandings'],
    );
  }
}
