class TMDBApi {
  final String apiKey;

  TMDBApi(this.apiKey);

  static const _baseUrl = 'api.themoviedb.org';
  static const _apiPath = '/3/tv/';
  static const _apiSearchPath = '/3/search/tv';

  String imageSrc(String path, String size) =>
      'https://image.tmdb.org/t/p/$size$path';

  Uri details(int id) => _buildUri('$id', {
        'api_key': apiKey,
        'language': 'en-US',
      });

  Uri popular({int page = 1}) => _buildUri('popular', {
        'api_key': apiKey,
        'language': 'en-US',
        'page': '$page',
      });

  Uri top({int page = 1}) => _buildUri('top_rated', {
        'api_key': apiKey,
        'language': 'en-US',
        'page': '$page',
      });

  Uri season(int id, int season) => _buildUri('$id/season/$season', {
        'api_key': apiKey,
        'language': 'en-US',
      });

  Uri episode(int id, int season, int episode) =>
      _buildUri('$id/season/$season/episode/$episode', {
        'api_key': apiKey,
        'language': 'en-US',
      });

  Uri recommendations(int id, {int page = 1}) =>
      _buildUri('$id/recommendations', {
        'api_key': apiKey,
        'language': 'en-US',
        'page': '$page',
      });

  Uri search(String query, {int page = 1}) {
    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: _apiSearchPath,
      queryParameters: {
        'api_key': apiKey,
        'language': 'en-US',
        'page': '$page',
        'query': query,
        'include_adult': 'false',
      },
    );
  }

  Uri _buildUri(String endpoint, Map<String, dynamic> queryParameters) {
    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '$_apiPath$endpoint',
      queryParameters: queryParameters,
    );
  }
}
