import 'package:notification_data/data.dart';
import 'package:notification_domain/domain.dart';

class NotificationRepository implements INotificationRepository {
  NotificationRepository(this._notificationDataSource);

  final NotificationDataSource _notificationDataSource;

  @override
  Future<List<CommunityNotification>> getNotifications() async {
    final dynamic response = await _notificationDataSource.getNotifications();
    final List<dynamic> jsonList = response as List<dynamic>;
    return jsonList
        .map(
          (json) =>
              CommunityNotification.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
