import 'package:flutter/material.dart';
import 'package:teamwavetask/common/constants/constants.dart';
import 'package:teamwavetask/presentation/widgets/country_list_tile.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The Sports DB',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ...availableCountriesList
                .map((_country) => CountryListTile(country: _country))
                .toList()
          ],
        ),
      ),
    );
  }
}
