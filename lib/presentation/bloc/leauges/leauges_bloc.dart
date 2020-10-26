import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';
import 'package:teamwavetask/domain/entity/params.dart';
import 'package:teamwavetask/domain/usecases/get_leauges.dart';
import 'package:teamwavetask/domain/usecases/get_search_leagues.dart';

part 'leauges_event.dart';
part 'leauges_state.dart';

class LeaugesBloc extends Bloc<LeaugesEvent, LeaugesState> {
  final GetLeaugesByCountry getLeauges;
  final GetLeaugesBySearch getSearchedLeagues;

  LeaugesBloc(this.getLeauges, this.getSearchedLeagues)
      : super(LeaugesInitial());

  @override
  Stream<LeaugesState> mapEventToState(
    LeaugesEvent event,
  ) async* {
    if (event is FetchLeaugesByCountry) {
      yield LeaugesLoading();
      final leaugesEither = await getLeauges(CountryParams(event.country));

      yield* leaugesEither.fold(
        (error) async* {
          yield LeaugesError(error.message);
        },
        (leauges) async* {
          if (leauges == null) {
            yield LeaugesNotFound();
          } else {
            yield LeaugesLoaded(leauges);
          }
        },
      );
    } else if (event is FetchLeaugesBySearch) {
      yield LeaugesLoading();

      final leaugesEither =
          await getSearchedLeagues(SearchParams(event.country, event.query));

      print({event.country, event.query});

      yield* leaugesEither.fold(
        (error) async* {
          print(error.message);

          yield LeaugesError(error.message);
        },
        (leauges) async* {
          print("loaded");
          if (leauges == null) {
            yield LeaugesNotFound();
          } else {
            yield LeaugesLoaded(leauges);
          }
        },
      );
    }
  }
}
