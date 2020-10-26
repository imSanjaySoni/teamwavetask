import 'package:dartz/dartz.dart';
import 'package:teamwavetask/domain/entity/app_error.dart';
import 'package:teamwavetask/domain/entity/params.dart';
import 'package:teamwavetask/domain/repository/leauges_repo_imp.dart';

import 'usecases.dart';

class GetLeaugePoster extends UseCase<String, SportParams> {
  final LeaugesRepository repository;

  GetLeaugePoster(this.repository);

  @override
  Future<Either<AppError, String>> call(SportParams params) async {
    return await repository.getLeaugePoster(sport: params.sport);
  }
}
