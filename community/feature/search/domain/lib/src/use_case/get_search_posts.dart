import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class GetSearchPostsUseCase
    implements IUseCase<List<Post>, GetSearchPostsParams> {
  GetSearchPostsUseCase(this._searchRepository);

  final ISearchRepository _searchRepository;

  @override
  Future<List<Post>> execute([GetSearchPostsParams? params]) {
    final GetSearchPostsParams input = params ?? GetSearchPostsParams();
    return _searchRepository.getSearchPosts(
      query: input.query,
      take: input.take,
      page: input.page,
    );
  }
}

class GetSearchPostsParams {
  GetSearchPostsParams({
    this.query = '',
    this.take = 10,
    this.page = 0,
  });

  final String query;
  final int take;
  final int page;
}
