import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show.dart';
import 'package:track/pages/detail_page/detail_page.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/favourite_button.dart';
import 'package:track/widgets/progress_indicators/show_progress_indicator.dart';

class ShowCard extends ConsumerWidget {
  const ShowCard({Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showsRepository = ref.watch(showsRepositoryProvider);

    void onTap(Show show) {
      // Remove focus after tapping e.g. due to search bar keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      showsRepository.getShow(show.id).then((showDetail) {
        return Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => DetailPage(show: showDetail)),
        ));
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShowProgressIndicator(showId: show.id, linear: true),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(show),
              child: _FilledCardPoster(
                imageUrl: showsRepository.imageSrc(
                  show.posterPath,
                  size: 'w400',
                ),
              ),
            ),
          ),
          _CardFooter(
            show: show,
            favouriteButton: FavouriteButton(showId: show.id),
          ),
        ],
      ),
    );
  }
}

class _CardFooter extends StatelessWidget {
  const _CardFooter(
      {Key? key, required this.show, required this.favouriteButton})
      : super(key: key);

  final Show show;
  final Widget favouriteButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(show.firstAirDate),
        const Spacer(),
        const Icon(Icons.star),
        Text('${show.voteAverage}'),
        const Spacer(),
        favouriteButton,
      ],
    );
  }
}

class _FilledCardPoster extends StatelessWidget {
  const _FilledCardPoster({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return _CardPoster(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _CardPoster extends StatelessWidget {
  const _CardPoster(
      {Key? key,
      required this.imageUrl,
      required this.fit,
      required this.width,
      required this.height})
      : super(key: key);

  final String imageUrl;
  final BoxFit fit;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (_, __) => const Center(
        child: Icon(
          Icons.broken_image,
          size: 75,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          size: 75,
        ),
      ),
    );
  }
}
