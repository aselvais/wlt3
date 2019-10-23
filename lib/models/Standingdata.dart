class Standingdata {

/*
      //imgurl : {showP: false, showL: true },
      team : { showP: true, showL: true, width: 6 },
      gp : { showP: true, showL: true, width: 1 },
      w : { showP: true, showL: true, width: 1 },
      so : { showP: true, showL: true, width: 1 },
      l : { showP: true, showL: true, width: 1 },
      t : { showP: true, showL: true, width: 1 },
      pts : { showP: true, showL: true, width: 2 },

      ga: { showP: false, showL: true, width: 1 },
      gf : { showP: false, showL: true, width: 1 },
      gfavg : { showP: false, showL: true, width: 3 },
      strk : { showP: false, showL: true, width: 2 },

      'pim': { showP: false, showL: true, width: 1 },
      '+|-': { showP: false, showL: true, width: 1 },
      ra: { showP: false, showL: true, width: 1 },
      rf: { showP: false, showL: true, width: 1 },
 */

  final String imgurl;
  final String team;
  final int teamId;
  final int gp;
  final int w;
  final int l;
  final int t;
  final int pts;
  final int gf;
  final int ga;
  final num gfavg;
  final String strk;

  Standingdata({
    this.imgurl,
    this.team,
    this.teamId,
    this.gp,
    this.w,
    this.l,
    this.t,
    this.pts,
    this.gf,
    this.ga,
    this.gfavg,
    this.strk,
  });

  factory Standingdata.fromJson(Map<String, dynamic> json) {
    return Standingdata(
      imgurl: json['imgurl'],
      team: json['team'],
      teamId: json['teamId'],
      gp: json['gp'],
      w: json['w'],
      l: json['l'],
      t: json['t'],
      pts: json['pts'],
      gf: json['gf'],
      ga: json['ga'],
      gfavg: json['gfavg'],
      strk: json['strk'],
    );
  }
}
