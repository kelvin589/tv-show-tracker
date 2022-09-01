import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/episode.dart';
import 'package:track/models/season.dart';
import 'package:track/models_stored/id_episode.dart';
import 'package:track/providers/state.dart';

final _watchedEpisodeProvider =
    StreamProvider.family.autoDispose<bool, IDEpisode>((ref, show) {
  return ref
      .read(watchedRepositoryProvider)
      .isWatchedStream(show.showId, show.seasonNumber, show.episodeNumber);
});

class EpisodeTile extends ConsumerWidget {
  const EpisodeTile({
    Key? key,
    required this.showId,
    required this.episode,
    required this.seasons,
  }) : super(key: key);

  final int showId;
  final Episode episode;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showsRepository = ref.watch(showsRepositoryProvider);
    final watched = ref.watch(_watchedEpisodeProvider(
      IDEpisode(
        showId: showId,
        seasonNumber: episode.seasonNumber,
        episodeNumber: episode.episodeNumber,
      ),
    ));

    void markWatched(bool? newValue) {
      ref.read(watchedRepositoryProvider).markWatched(
            showId,
            seasons,
            episode.seasonNumber,
            episode.episodeNumber,
            newValue ?? false,
          );
    }

    return Opacity(
      opacity: episode.hasAired() ? 1 : 0.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _EpisodeImage(
              url: showsRepository.imageSrc(episode.stillPath, size: 'w200'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: _EpisodeDetail(episode: episode),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Checkbox(
              value: watched.whenOrNull(data: (data) => data) ?? false,
              onChanged: !episode.hasAired() ? null : markWatched,
            ),
          ),
        ],
      ),
    );
  }
}

class _EpisodeImage extends StatelessWidget {
  const _EpisodeImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (_, __, ___) => Icon(
        Icons.broken_image,
        size: 75 * MediaQuery.of(context).size.aspectRatio,
      ),
    );
  }
}

class _EpisodeDetail extends StatelessWidget {
  const _EpisodeDetail({Key? key, required this.episode}) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('S${episode.seasonNumber}E${episode.episodeNumber}: ${episode.name}'),
        !episode.hasAired() ? Container() : Text('★ ${episode.voteAverage}'),
        episode.hasAired() ? Container() : Text('Air Date: ${episode.airDate}'),
      ],
    );
  }
}
