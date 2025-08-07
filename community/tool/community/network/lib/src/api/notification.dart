import 'package:tool_community_network/network.dart';

class NotificationApi {
  const NotificationApi(this._client);

  final CommunityRestClient _client;

  Future<dynamic> getNotifications() {
    return _client
        .get<dynamic>('/notification-api/notifications')
        .then((value) => value.data);
  }
}

class MockNotificationApi extends NotificationApi {
  MockNotificationApi(super.client);

  @override
  Future<dynamic> getNotifications() {
    return loadJsonData('assets/json/get_notifications.json');
  }
}
