import 'package:tool_community_network/network.dart';

abstract class IPostRemoteDataSource {

  Future<dynamic> getPopularChannels();

  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  });
}

class PostRemoteDataSource implements IPostRemoteDataSource {
  PostRemoteDataSource(this._api);

  final PostApi _api;

  @override
  Future<dynamic> getPopularChannels() {
    return _api.getPopularChannels();
  }

  @override
  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return _api.getSearchPosts(
      query: query,
      take: take,
      page: page,
    );
  }
}
