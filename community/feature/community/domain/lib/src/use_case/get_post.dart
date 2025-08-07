import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetPostUseCase implements IUseCase<Post, GetPostParams> {
  GetPostUseCase(this._postRepository);

  final IPostRepository _postRepository;

  @override
  Future<Post> execute([GetPostParams? params]) async {
    if (params == null) return Post.empty();
    return _postRepository.getPost(
      id: params.postId,
    );
  }
}

class GetPostParams {
  GetPostParams({
    required this.postId,
  });

  final String postId;
}
