import 'package:flutter/material.dart';
import 'package:track/models/season.dart';
import 'package:track/widgets/progress_indicators/season_progress_indicator.dart';

class SeasonTile extends StatelessWidget {
  const SeasonTile({
    Key? key,
    required this.showId,
    required this.season,
  }) : super(key: key);

  final int showId;
  final Season season;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(season.name),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SeasonProgressIndicator(
            showId: showId,
            season: season.seasonNumber,
          ),
        ),
      ],
    );
  }
}
