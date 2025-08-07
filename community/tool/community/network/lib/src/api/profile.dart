import 'package:tool_community_network/network.dart';

class ProfileApi {
  const ProfileApi(this._client);

  final CommunityRestClient _client;

  Future<dynamic> getMy() {
    return _client.get<dynamic>('/profile-api/my').then((value) => value.data);
  }
}

class MockProfileApi extends ProfileApi {
  MockProfileApi(super.client);

  @override
  Future<dynamic> getMy() {
    return loadJsonData('assets/json/get_my.json');
  }
}
