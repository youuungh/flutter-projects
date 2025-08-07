import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';

class CommunityRepository implements ICommunityRepository {
  CommunityRepository(this._communityDataSource);

  final CommunityDataSource _communityDataSource;

  @override
  Future<List<Channel>> getChannels() async {
    final dynamic response = await _communityDataSource.getChannels();
    final List<dynamic> jsonList = response as List<dynamic>;
    return jsonList
        .map((json) => Channel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Channel>> getPopularChannels() async {
    final dynamic response = await _communityDataSource.getPopularChannels();
    final List<dynamic> jsonList = response as List<dynamic>;
    return jsonList
        .map((json) => Channel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Post>> getPosts({
    int take = 10,
    int page = 0,
  }) async {
    final dynamic response = await _communityDataSource.getPosts(
      take: take,
      page: page,
    );
    final List<dynamic> jsonList = response as List<dynamic>;
    return jsonList
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
