class AllSportsResultModel {
  List<SportsModel> sports;

  AllSportsResultModel({this.sports});

  AllSportsResultModel.fromJson(Map<String, dynamic> json) {
    if (json['sports'] != null) {
      sports = new List<SportsModel>();
      json['sports'].forEach((v) {
        sports.add(new SportsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sports != null) {
      data['sports'] = this.sports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SportsModel {
  String strSport;
  String strSportThumb;

  SportsModel({
    this.strSport,
    this.strSportThumb,
  });

  SportsModel.fromJson(Map<String, dynamic> json) {
    strSport = json['strSport'];
    strSportThumb = json['strSportThumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strSport'] = this.strSport;
    data['strSportThumb'] = this.strSportThumb;

    return data;
  }
}
