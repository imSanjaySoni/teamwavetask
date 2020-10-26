import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamwavetask/presentation/bloc/leauges/leauges_bloc.dart';
import 'package:teamwavetask/presentation/screens/available_leagues.dart';

class CountryListTile extends StatelessWidget {
  final String country;

  const CountryListTile({
    Key key,
    @required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          tileColor: Colors.white54,
          onTap: () {
            BlocProvider.of<LeaugesBloc>(context)
                .add(FetchLeaugesByCountry(country));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AvailableLeagues(countryTitle: country),
              ),
            );
          },
          title: Text(
            country,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
