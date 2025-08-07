import 'package:notification_data/data.dart';

class NotificationDataSource {
  NotificationDataSource(this._notificationRemoteDataSource);

  final INotificationRemoteDataSource _notificationRemoteDataSource;

  Future<dynamic> getNotifications() {
    return _notificationRemoteDataSource.getNotifications();
  }
}
