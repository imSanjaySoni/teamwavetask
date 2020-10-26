import 'package:teamwavetask/domain/entity/leauges_entity.dart';

class LeaugesResultModel {
  List<LeaugesModel> leauges;

  LeaugesResultModel({this.leauges});

  LeaugesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['countrys'] != null) {
      leauges = new List<LeaugesModel>();
      json['countrys'].forEach((v) {
        leauges.add(new LeaugesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leauges != null) {
      data['countrys'] = this.leauges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeaugesModel extends LeaugesEntity {
  String strLeague;
  String strFacebook;
  String strTwitter;
  String strLogo;
  String strSport;

  LeaugesModel({
    this.strLeague,
    this.strFacebook,
    this.strTwitter,
    this.strLogo,
    this.strSport,
  }) : super(
            strLeague: strLeague,
            strFacebook: strFacebook,
            strTwitter: strTwitter,
            strLogo: strLogo,
            strSport: strSport);

  LeaugesModel.fromJson(Map<String, dynamic> json) {
    strLeague = json['strLeague'];
    strFacebook = json['strFacebook'];
    strTwitter = json['strTwitter'];
    strLogo = json['strLogo'];
    strSport = json['strSport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strLeague'] = this.strLeague;
    data['strFacebook'] = this.strFacebook;
    data['strTwitter'] = this.strTwitter;
    data['strLogo'] = this.strLogo;
    data['strSport'] = this.strSport;

    return data;
  }
}
