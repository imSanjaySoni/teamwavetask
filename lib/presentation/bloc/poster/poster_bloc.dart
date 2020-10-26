import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teamwavetask/domain/entity/params.dart';
import 'package:teamwavetask/domain/usecases/get_leauge_poster.dart';

part 'poster_event.dart';
part 'poster_state.dart';

class PosterBloc extends Bloc<PosterEvent, PosterState> {
  final GetLeaugePoster getLeaugePoster;
  PosterBloc(this.getLeaugePoster) : super(PosterInitial());

  @override
  Stream<PosterState> mapEventToState(
    PosterEvent event,
  ) async* {
    if (event is FetchPoster) {
      yield PosterLoading();
      final posterEither = await getLeaugePoster(SportParams(event.sport));

      yield* posterEither.fold((error) async* {
        print(error.message);
        yield PosterError(error.message);
      }, (poster) async* {
        print(poster);
        yield PosterLoaded(poster);
      });
    }
  }
}
