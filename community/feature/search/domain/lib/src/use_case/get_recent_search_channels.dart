import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class GetRecentSearchChannelsUseCase implements IUseCase<List<Channel>, void> {
  GetRecentSearchChannelsUseCase(this._searchRepository);

  final ISearchRepository _searchRepository;

  @override
  Future<List<Channel>> execute([void params]) {
    return _searchRepository.getRecentSearchChannels();
  }
}
