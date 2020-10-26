import 'package:dartz/dartz.dart';
import 'package:teamwavetask/domain/entity/app_error.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';
import 'package:teamwavetask/domain/entity/params.dart';
import 'package:teamwavetask/domain/repository/leauges_repo_imp.dart';

import 'usecases.dart';

class GetLeaugesByCountry extends UseCase<List<LeaugesEntity>, CountryParams> {
  final LeaugesRepository repository;

  GetLeaugesByCountry(this.repository);

  @override
  Future<Either<AppError, List<LeaugesEntity>>> call(
      CountryParams params) async {
    return await repository.getLeaugesByCountry(country: params.country);
  }
}
