part of 'poster_bloc.dart';

abstract class PosterState extends Equatable {
  const PosterState();

  @override
  List<Object> get props => [];
}

class PosterInitial extends PosterState {}

class PosterLoading extends PosterState {
  @override
  List<Object> get props => [];
}

class PosterLoaded extends PosterState {
  final String posterPath;

  PosterLoaded(this.posterPath);

  @override
  List<Object> get props => [posterPath];
}

class PosterError extends PosterState {
  final String message;

  PosterError(this.message);

  @override
  List<Object> get props => [message];
}
