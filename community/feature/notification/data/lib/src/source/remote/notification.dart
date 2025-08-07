import 'package:tool_community_network/network.dart';

abstract class INotificationRemoteDataSource {
  Future<dynamic> getNotifications();
}

class NotificationRemoteDataSource implements INotificationRemoteDataSource {
  NotificationRemoteDataSource(this._api);

  final NotificationApi _api;

  @override
  Future<dynamic> getNotifications() {
    return _api.getNotifications();
  }
}
