import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:teamwavetask/domain/usecases/get_leauge_poster.dart';
import 'package:teamwavetask/domain/usecases/get_leauges.dart';
import 'package:teamwavetask/domain/usecases/get_search_leagues.dart';
import 'package:teamwavetask/presentation/bloc/poster/poster_bloc.dart';

import 'core/api_client.dart';
import 'data/data_sources/leauges_remote_data_source.dart';
import 'data/repository/leauges_repository.dart';
import 'domain/repository/leauges_repo_imp.dart';
import 'presentation/bloc/leauges/leauges_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<LeaugesRemoteDataSource>(
      () => LeaugesRemoteDataSourceImp(getItInstance()));

  getItInstance.registerLazySingleton<GetLeaugesByCountry>(
      () => GetLeaugesByCountry(getItInstance()));

  getItInstance.registerLazySingleton<GetLeaugesBySearch>(
      () => GetLeaugesBySearch(getItInstance()));

  getItInstance.registerLazySingleton<GetLeaugePoster>(
      () => GetLeaugePoster(getItInstance()));

  getItInstance.registerLazySingleton<LeaugesRepository>(
      () => LeaugesRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<LeaugesBloc>(
    () => LeaugesBloc(getItInstance(), getItInstance()),
  );

  getItInstance.registerLazySingleton<PosterBloc>(
    () => PosterBloc(getItInstance()),
  );
}
