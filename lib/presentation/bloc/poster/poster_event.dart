part of 'poster_bloc.dart';

abstract class PosterEvent extends Equatable {
  const PosterEvent();

  @override
  List<Object> get props => [];
}

class FetchPoster extends PosterEvent {
  final String sport;

  FetchPoster(this.sport);
  @override
  List<Object> get props => [sport];
}
