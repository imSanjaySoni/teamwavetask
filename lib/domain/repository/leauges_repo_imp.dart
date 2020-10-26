import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:teamwavetask/domain/entity/app_error.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';

abstract class LeaugesRepository {
  Future<Either<AppError, List<LeaugesEntity>>> getLeaugesByCountry(
      {@required String country});
  Future<Either<AppError, List<LeaugesEntity>>> getLeaugesBySearch(
      {@required String country, @required String query});
  Future<Either<AppError, String>> getLeaugePoster({@required String sport});
}
