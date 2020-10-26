import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  final query;
  final country;

  SearchParams(this.country, this.query);

  @override
  List<Object> get props => [query];
}

class SportParams extends Equatable {
  final String sport;
  SportParams(this.sport);

  @override
  List<Object> get props => [sport];
}

class CountryParams extends Equatable {
  final String country;
  CountryParams(this.country);

  @override
  List<Object> get props => [country];
}
