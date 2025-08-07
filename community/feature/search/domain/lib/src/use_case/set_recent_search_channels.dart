import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class SetRecentSearchChannelsUseCase
    implements IUseCase<bool, SetRecentSearchChannelsParams> {
  SetRecentSearchChannelsUseCase(this._searchRepository);

  final ISearchRepository _searchRepository;

  @override
  Future<bool> execute([SetRecentSearchChannelsParams? params]) async {
    if (params == null) return false;
    return _searchRepository.setRecentSearchChannels(
      channelList: params.channelList,
    );
  }
}

class SetRecentSearchChannelsParams {
  SetRecentSearchChannelsParams({
    required this.channelList,
  });

  final List<Channel> channelList;
}
