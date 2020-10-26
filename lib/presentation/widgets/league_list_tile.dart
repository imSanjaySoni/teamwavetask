import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:teamwavetask/di.dart';
import 'package:teamwavetask/domain/entity/leauges_entity.dart';
import 'package:teamwavetask/presentation/bloc/poster/poster_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LeagueListTile extends StatefulWidget {
  final LeaugesEntity leauge;

  const LeagueListTile({Key key, this.leauge}) : super(key: key);

  @override
  _LeagueListTileState createState() => _LeagueListTileState();
}

class _LeagueListTileState extends State<LeagueListTile> {
  @override
  void initState() {
    getItInstance<PosterBloc>().add(FetchPoster(widget.leauge.strSport));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosterBloc, PosterState>(
      bloc: getItInstance<PosterBloc>(),
      builder: (context, state) => Container(
        margin: const EdgeInsets.all(8),
        height: 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: state is PosterLoaded
                ? NetworkImage(state.posterPath)
                : NetworkImage(""),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 140,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.leauge.strLeague,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            widget.leauge.strFacebook != null
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      FontAwesome.facebook_square,
                                      color: Colors.white,
                                    ),
                                    onPressed: () =>
                                        _launchURL(widget.leauge.strFacebook),
                                  )
                                : SizedBox.shrink(),
                            widget.leauge.strTwitter != null
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      FontAwesome.twitter_square,
                                      color: Colors.white,
                                    ),
                                    onPressed: () =>
                                        _launchURL(widget.leauge.strTwitter),
                                  )
                                : SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 80,
                    height: 80,
                    child: widget.leauge.strLogo != null
                        ? Image.network(
                            widget.leauge.strLogo,
                            width: 80,
                            height: 80,
                          )
                        : SizedBox.shrink(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (!url.contains("http://") || !url.contains("https://"))
      url = "https://$url";

    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
