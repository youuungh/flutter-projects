import 'package:search_data/data.dart';

class SearchDataSource {
  SearchDataSource(
    this._preferenceLocalDataSource,
    this._postRemoteDataSource,
  );

  static const String recentSearchKey = 'recentSearchKey';

  final IPreferenceLocalDataSource _preferenceLocalDataSource;
  final IPostRemoteDataSource _postRemoteDataSource;

  Future<dynamic> getPopularChannels() {
    return _postRemoteDataSource.getPopularChannels();
  }

  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return _postRemoteDataSource.getSearchPosts(
      query: query,
      take: take,
      page: page,
    );
  }

  Future<bool> setRecentSearchChannels(String json) {
    return _preferenceLocalDataSource.setString(recentSearchKey, json);
  }

  Future<String> getRecentSearchChannels() {
    return _preferenceLocalDataSource.getString(recentSearchKey);
  }
}
