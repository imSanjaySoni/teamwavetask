import 'package:dartz/dartz.dart';
import 'package:teamwavetask/domain/entity/app_error.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';
import 'package:teamwavetask/domain/entity/params.dart';
import 'package:teamwavetask/domain/repository/leauges_repo_imp.dart';

import 'usecases.dart';

class GetLeaugesBySearch extends UseCase<List<LeaugesEntity>, SearchParams> {
  final LeaugesRepository repository;

  GetLeaugesBySearch(this.repository);

  @override
  Future<Either<AppError, List<LeaugesEntity>>> call(
      SearchParams params) async {
    return await repository.getLeaugesBySearch(
        country: params.country, query: params.query);
  }
}
