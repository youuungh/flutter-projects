import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetPostsUseCase implements IUseCase<List<Post>, GetPostsParams> {
  GetPostsUseCase(this._communityRepository);

  final ICommunityRepository _communityRepository;

  @override
  Future<List<Post>> execute([GetPostsParams? params]) {
    final GetPostsParams input = params ?? GetPostsParams();
    return _communityRepository.getPosts(
      take: input.take,
      page: input.page,
    );
  }
}

class GetPostsParams {
  GetPostsParams({
    this.take = 10,
    this.page = 0,
  });

  final int take;
  final int page;
}
