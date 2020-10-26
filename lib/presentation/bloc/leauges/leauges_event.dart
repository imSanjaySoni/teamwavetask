part of 'leauges_bloc.dart';

abstract class LeaugesEvent extends Equatable {
  const LeaugesEvent();

  @override
  List<Object> get props => [];
}

class FetchLeaugesByCountry extends LeaugesEvent {
  final country;
  FetchLeaugesByCountry(this.country);

  @override
  List<Object> get props => [country];
}

class FetchLeaugesBySearch extends LeaugesEvent {
  final country;
  final query;

  FetchLeaugesBySearch(this.country, this.query);

  @override
  List<Object> get props => [country, query];
}
