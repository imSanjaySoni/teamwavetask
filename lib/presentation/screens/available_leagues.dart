import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamwavetask/di.dart';
import 'package:teamwavetask/presentation/bloc/leauges/leauges_bloc.dart';
import 'package:teamwavetask/presentation/widgets/league_list_tile.dart';
import 'package:teamwavetask/presentation/widgets/search_feild.dart';

class AvailableLeagues extends StatelessWidget {
  final String countryTitle;

  const AvailableLeagues({Key key, @required this.countryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(countryTitle),
        ),
        body: ListView(
          children: [
            SearchField(country: countryTitle),
            BlocBuilder<LeaugesBloc, LeaugesState>(
              bloc: getItInstance<LeaugesBloc>(),
              builder: (context, state) {
                if (state is LeaugesInitial || state is LeaugesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is LeaugesLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.leaugesList.length,
                    itemBuilder: (context, index) => LeagueListTile(
                      leauge: state.leaugesList[index],
                    ),
                  );
                } else if (state is LeaugesError) {
                  return Center(child: Text(state.message));
                } else if (state is LeaugesNotFound) {
                  return Center(child: Text(state.message));
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
