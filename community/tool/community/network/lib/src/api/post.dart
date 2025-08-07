import 'package:tool_community_network/network.dart';

class PostApi {
  const PostApi(this._client);

  final CommunityRestClient _client;

  Future<dynamic> getChannels() {
    return _client
        .get<dynamic>('/post-api/channels')
        .then((value) => value.data);
  }

  Future<dynamic> getPopularChannels() {
    return _client
        .get<dynamic>('/post-api/popular/channels')
        .then((value) => value.data);
  }

  Future<dynamic> getPosts({
    int? take,
    int? page,
  }) {
    return _client
        .get<dynamic>(
          '/post-api/posts',
          queryParameters: {
            if (take != null) 'take': take,
            if (page != null) 'page': page,
          },
        )
        .then((value) => value.data);
  }

  Future<dynamic> createPost({
    required String channel,
    required String title,
    required String content,
  }) {
    return _client
        .post<dynamic>(
          '/post-api/post/create',
          data: {
            'channel': channel,
            'title': title,
            'content': content,
          },
        )
        .then((value) => value.data);
  }

  Future<dynamic> getPost({
    required String id,
  }) {
    return _client
        .get<dynamic>('/post-api/post/$id')
        .then((value) => value.data);
  }

  Future<dynamic> getComments({
    required String postId,
    int? take,
    int? page,
  }) {
    return _client
        .get<dynamic>(
          '/post-api/comments/$postId',
          queryParameters: {
            if (take != null) 'take': take,
            if (page != null) 'page': page,
          },
        )
        .then((value) => value.data);
  }

  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return _client
        .get<dynamic>(
          '/post-api/posts/search',
          queryParameters: {
            'query': query,
            if (take != null) 'take': take,
            if (page != null) 'page': page,
          },
        )
        .then((value) => value.data);
  }
}

class MockPostApi extends PostApi {
  MockPostApi(super.client);

  @override
  Future<dynamic> getChannels() {
    return loadJsonData('assets/json/get_channels.json');
  }

  @override
  Future<dynamic> getPopularChannels() {
    return loadJsonData('assets/json/get_popular_channels.json');
  }

  @override
  Future<dynamic> getPosts({
    int? take,
    int? page,
  }) {
    return loadJsonData('assets/json/get_posts.json');
  }

  @override
  Future<dynamic> createPost({
    required String channel,
    required String title,
    required String content,
  }) {
    return loadJsonData('assets/json/get_post.json');
  }

  @override
  Future<dynamic> getPost({
    required String id,
  }) {
    return loadJsonData('assets/json/get_post.json');
  }

  @override
  Future<dynamic> getComments({
    required String postId,
    int? take,
    int? page,
  }) {
    return loadJsonData('assets/json/get_comments.json');
  }

  @override
  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return loadJsonData('assets/json/get_search_posts.json');
  }
}
