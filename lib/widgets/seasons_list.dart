import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/season.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/episode_tile.dart';
import 'package:track/widgets/next_episode_tile.dart';
import 'package:track/widgets/progress_indicators/show_progress_indicator.dart';
import 'package:track/widgets/season_tile.dart';

final _seasonsProvider = FutureProvider.autoDispose
    .family<List<Season>, ShowDetail>((ref, show) async {
  final showsRepository = ref.watch(showsRepositoryProvider);
  return showsRepository.getSeasons(show.id, show.numberOfSeasons);
});

class SeasonsList extends ConsumerWidget {
  const SeasonsList({Key? key, required this.show}) : super(key: key);

  final ShowDetail show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasons = ref.watch(_seasonsProvider(show));

    return seasons.when(
      data: (seasons) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NextEpisode(showId: show.id, seasons: seasons),
          const SizedBox(height: 20),
          Expanded(
            child: _Seasons(showId: show.id, seasons: seasons),
          ),
        ],
      ),
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _NextEpisode extends StatelessWidget {
  const _NextEpisode({Key? key, required this.showId, required this.seasons})
      : super(key: key);

  final int showId;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Next Episode',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        NextEpisodeTile(showId: showId, seasons: seasons),
      ],
    );
  }
}

class _Seasons extends StatelessWidget {
  const _Seasons({Key? key, required this.showId, required this.seasons})
      : super(key: key);

  final int showId;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: seasons.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _SeasonsHeader(showId: showId);
        }

        final season = seasons[--index];

        return ExpansionTile(
          title: SeasonTile(showId: showId, season: season),
          children: season.episodes.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: EpisodeTile(
                showId: showId,
                episode: e,
                seasons: seasons,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SeasonsHeader extends StatelessWidget {
  const _SeasonsHeader({Key? key, required this.showId}) : super(key: key);

  final int showId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Seasons',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShowProgressIndicator(showId: showId),
        ),
      ],
    );
  }
}
