import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';

class PostRepository implements IPostRepository {
  PostRepository(this._postDataSource);

  final PostDataSource _postDataSource;

  Future<Post> getPost({
    required String id,
  }) async {
    final dynamic json = await _postDataSource.getPost(
      id: id,
    );
    return Post.fromJson(json as Map<String, dynamic>);
  }

  Future<List<Comment>> getComments({
    required String postId,
    int? take,
    int? page,
  }) async {
    final dynamic response = await _postDataSource.getComments(
      postId: postId,
      take: take,
      page: page,
    );
    final List<dynamic> jsonList = response as List<dynamic>;
    return jsonList
        .map((json) => Comment.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
