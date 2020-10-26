part of 'leauges_bloc.dart';

abstract class LeaugesState extends Equatable {
  const LeaugesState();

  @override
  List<Object> get props => [];
}

class LeaugesInitial extends LeaugesState {}

class LeaugesNotFound extends LeaugesState {
  final String message = "Leauges not found";

  @override
  List<Object> get props => [message];
}

class LeaugesLoading extends LeaugesState {
  @override
  List<Object> get props => [];
}

class LeaugesLoaded extends LeaugesState {
  final List<LeaugesEntity> leaugesList;

  LeaugesLoaded(this.leaugesList);

  @override
  List<Object> get props => [leaugesList];
}

class LeaugesError extends LeaugesState {
  final String message;

  LeaugesError(this.message);

  @override
  List<Object> get props => [message];
}
