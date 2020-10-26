import 'package:flutter/foundation.dart';
import 'package:teamwavetask/common/constants/constants.dart';
import 'package:teamwavetask/core/api_client.dart';
import 'package:teamwavetask/data/model/all_sports_model.dart';
import 'package:teamwavetask/data/model/leauges_model.dart';

abstract class LeaugesRemoteDataSource {
  Future<List<LeaugesModel>> getLeaugesByCountry({@required String country});
  Future<List<LeaugesModel>> getLeaugesBySearch(
      {@required String country, @required String query});
  Future<String> getPosterPath({@required String sport});
}

class LeaugesRemoteDataSourceImp implements LeaugesRemoteDataSource {
  final ApiClient _client;
  LeaugesRemoteDataSourceImp(this._client);

  @override
  Future<List<LeaugesModel>> getLeaugesByCountry(
      {@required String country}) async {
    final response = await _client.get("$LEAGUE_PATH?c=$country");
    final leauges = LeaugesResultModel.fromJson(response).leauges;
    return leauges;
  }

  @override
  Future<List<LeaugesModel>> getLeaugesBySearch(
      {@required String country, @required String query}) async {
    final response = await _client.get('$SEARCH_PATH?c=$country&s=$query');
    final leauges = LeaugesResultModel.fromJson(response).leauges;
    print(leauges);
    return leauges;
  }

  @override
  Future<String> getPosterPath({String sport}) async {
    final response = await _client.get('$ALL_SPORTS_PATH');
    final posterPath = AllSportsResultModel.fromJson(response)
        .sports
        .firstWhere((element) => element.strSport == sport);
    print(posterPath.strSportThumb);
    return posterPath.strSportThumb;
  }
}
