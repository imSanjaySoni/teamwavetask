import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamwavetask/di.dart';
import 'package:teamwavetask/presentation/bloc/poster/poster_bloc.dart';
import 'package:teamwavetask/presentation/screens/country_list.dart';
import 'package:pedantic/pedantic.dart';

import 'di.dart' as getIt;
import 'presentation/bloc/leauges/leauges_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(BaseApp());
}

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sport DB',
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            centerTitle: false,
            elevation: 0,
            color: Colors.red[800],
          )),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LeaugesBloc>(
              create: (_) => getItInstance<LeaugesBloc>()),
          BlocProvider<PosterBloc>(create: (_) => getItInstance<PosterBloc>()),
        ],
        child: CountryList(),
      ),
    );
  }
}
