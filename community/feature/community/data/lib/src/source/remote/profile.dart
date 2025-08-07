import 'package:tool_community_network/network.dart';

abstract class IProfileRemoteDataSource {
  Future<dynamic> getMy();
}

class ProfileRemoteDataSource implements IProfileRemoteDataSource {
  ProfileRemoteDataSource(this._api);

  final ProfileApi _api;

  @override
  Future<dynamic> getMy() {
    return _api.getMy();
  }
}
