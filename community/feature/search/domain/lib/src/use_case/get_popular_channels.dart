import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class GetPopularChannelsForSearchUseCase
    implements IUseCase<List<Channel>, void> {
  GetPopularChannelsForSearchUseCase(this._searchRepository);

  final ISearchRepository _searchRepository;

  @override
  Future<List<Channel>> execute([void params]) {
    return _searchRepository.getPopularChannels();
  }
}
