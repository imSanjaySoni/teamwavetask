import 'package:flutter/foundation.dart';
import 'package:teamwavetask/data/data_sources/leauges_remote_data_source.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';
import 'package:teamwavetask/domain/entity/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:teamwavetask/domain/repository/leauges_repo_imp.dart';

class LeaugesRepositoryImpl implements LeaugesRepository {
  final LeaugesRemoteDataSource remoteDataSource;
  LeaugesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<LeaugesEntity>>> getLeaugesByCountry(
      {@required String country}) async {
    try {
      final leaugesList =
          await remoteDataSource.getLeaugesByCountry(country: country);
      return Right(leaugesList);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<LeaugesEntity>>> getLeaugesBySearch(
      {@required String country, @required String query}) async {
    try {
      final leaugesList = await remoteDataSource.getLeaugesBySearch(
          country: country, query: query);
      return Right(leaugesList);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, String>> getLeaugePoster(
      {@required String sport}) async {
    try {
      final posterPath = await remoteDataSource.getPosterPath(sport: sport);
      return Right(posterPath);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }
}
