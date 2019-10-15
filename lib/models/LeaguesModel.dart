import 'package:flutter/foundation.dart';


class LeaguesModel extends ChangeNotifier {
  int _idx = 0;

  List _list = [
    {
      "id": 162,
      "name": "Avenue Road Hockey Association",
      "shortName": "Avenue Road Hockey Association",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=ADX_ARHALogo2.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 169,
      "name": "Carleton Place - Support the Troops Tournament",
      "shortName": "Support the Troops Tournament",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Agz_Carleton Place Cyclones.jpg",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 156,
      "name": "Don Mills Civitan Hockey League - Tournament",
      "shortName": "DMCHL - Tournament",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=SjR_DMM_logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 165,
      "name": "Faustina Christmas Select Tournament",
      "shortName": "Faustina Christmas Select Tournament",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=zOM_Faustina Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 160,
      "name": "Faustina Hockey Club",
      "shortName": "Faustina Hockey Club",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=vMx_Faustina Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 177,
      "name": "Gene Harrington Tournaments",
      "shortName": "Gene Harrington Tournaments",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=dss_Gene Harrington-Tournament-Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 186,
      "name": "GGTS",
      "shortName": "GGTS",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Tgy_ggtsLogo1.png",
      "androidAppURL": "",
      "iosAppURL": ""
    },
    {
      "id": 163,
      "name": "Humber Valley Hockey Association - Select Tournament",
      "shortName": "Humber Valley Hockey - Select Tournament",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=SLw_HumberValleySharks Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 182,
      "name": "Leaside Baseball Association",
      "shortName": "Leaside Baseball Association",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=PNU_LBALogo.png",
      "androidAppURL": "",
      "iosAppURL": ""
    },
    {
      "id": 176,
      "name": "Leaside Hockey Association",
      "shortName": "Leaside Hockey Association",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=ssj_rsz_leasidelogo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 161,
      "name": "Leaside Select Invitational",
      "shortName": "Leaside Select Invitational",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=WnG_Leaside.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 171,
      "name": "MHL Challenge Tournament",
      "shortName": "MHL Challenge Tournament",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=UgN_MHL-logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 152,
      "name": "Niagara Falls Blizzard Challenge",
      "shortName": "NST - Blizzard Challenge",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=HCi_NST Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 154,
      "name": "Niagara Falls Championship Cup",
      "shortName": "NST - Championship Cup",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Nmo_NST Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 150,
      "name": "Niagara Falls Columbus Day Early Bird",
      "shortName": "NST - Columbus Day Early Bird",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Qxm_NST Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 151,
      "name": "Niagara Falls Festival of Lights - Thanksgiving",
      "shortName": "NST - Festival of Lights",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=XOf_NST Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 153,
      "name": "Niagara Falls Presidents Day Tournament",
      "shortName": "NST - Presidents Day",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=EvT_NST Logo2.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 127,
      "name": "North York Hockey League",
      "shortName": "NYHL",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=fBt_NYHLLogo-RB-SQ.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 139,
      "name": "North York Knights",
      "shortName": "NYKHA",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=qnM_NYKLogo.png",
      "androidAppURL": null,
      "iosAppURL": null
    },
    {
      "id": 116,
      "name": "North York Lynx Ball Hockey League",
      "shortName": "NYLBHL",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=yPh_NYBHL Logo.gif",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 178,
      "name": "North York Women's Ball Hockey League",
      "shortName": "NYWBHL",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=XfE_NYWBHL Logo - Panthers - Tranparent.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 132,
      "name": "Ontario Ball Hockey Association - Provincials",
      "shortName": "OBHA Provincials",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=PIa_OBHA.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 187,
      "name": "Paramount Ice",
      "shortName": "Paramount Ice",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Agz_paramount-ice-logo.png",
      "androidAppURL": "",
      "iosAppURL": ""
    },
    {
      "id": 130,
      "name": "Parkwoods Hockey League",
      "shortName": "Parkwoods",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=arw_Parkwoods Logo.jpeg",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 147,
      "name": "Thornhill Community Hockey League",
      "shortName": "TCHL",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Zxw_TCHL-Logo-75.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 185,
      "name": "Toronto Aces Hockey",
      "shortName": "Toronto Aces Hockey",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=hZj_Toronto Aces Hockey Logo.png",
      "androidAppURL": "",
      "iosAppURL": ""
    },
    {
      "id": 184,
      "name": "Toronto Baseball Association",
      "shortName": "Toronto Baseball Association",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=JGy_TBA Logo.jpg",
      "androidAppURL": "",
      "iosAppURL": ""
    },
    {
      "id": 145,
      "name": "Toronto District Catholic Athletic Association - Soccer",
      "shortName": "TDCAA Indoor Soccer",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=cQZ_TDCAA Logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 148,
      "name": "Victoria Village Hockey League",
      "shortName": "VVHL",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=Kmz_victoriavillage logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    },
    {
      "id": 166,
      "name": "Victoria Village Select Invitational",
      "shortName": "Victoria Village Select Invitational",
      "imageUrl":
          "http://admin.winloseortie.com/files/image?directory=team_images&filename=SLD_victoriavillage logo.png",
      "androidAppURL":
          "https://play.google.com/store/apps/details?id=com.winloseortie",
      "iosAppURL": ""
    }
  ];


  int get idx { 
    return _idx;
  }

  set idx(v) {
    _idx = v;
    notifyListeners();
  }

  get list {
    return _list;
  }

}