import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/widgets/favourite_button.dart';
import 'package:track/widgets/recommendations_list.dart';

class InformationPage extends ConsumerWidget {
  const InformationPage({Key? key, required this.show}) : super(key: key);

  final ShowDetail show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      shrinkWrap: true,
      controller: ScrollController(),
      children: [
        _Overview(showId: show.id, overview: show.overview),
        const SizedBox(height: 20),
        _GenreTags(tags: <String>[
          ...show.genres.map((e) => e.name),
          show.status,
          show.language,
          show.type,
          '★ ${show.voteAverage.toString()}',
        ]),
        const SizedBox(height: 20),
        _Recommendations(showId: show.id),
      ],
    );
  }
}

class _GenreTags extends StatelessWidget {
  const _GenreTags({Key? key, required this.tags}) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 4.0, top: 4.0),
                child: Chip(
                  label: Text(e),
                ),
              ))
          .toList(),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key, required this.showId, required this.overview})
      : super(key: key);

  final int showId;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Overview',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            FavouriteButton(showId: showId)
          ],
        ),
        Text(overview),
      ],
    );
  }
}

class _Recommendations extends StatelessWidget {
  const _Recommendations({Key? key, required this.showId}) : super(key: key);

  final int showId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendations',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 300,
          child: RecommendationsList(showId: showId, horizontal: true),
        ),
      ],
    );
  }
}
