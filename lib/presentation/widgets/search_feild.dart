import 'package:flutter/material.dart';
import 'package:teamwavetask/di.dart';
import 'package:teamwavetask/presentation/bloc/leauges/leauges_bloc.dart';

class SearchField extends StatelessWidget {
  final String country;

  const SearchField({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search Leagues...",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        onSubmitted: (q) {
          if (_searchController.text.isNotEmpty)
            getItInstance<LeaugesBloc>().add(FetchLeaugesBySearch(country, q));
        },
      ),
    );
  }
}
