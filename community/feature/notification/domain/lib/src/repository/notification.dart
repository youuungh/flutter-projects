import 'package:notification_domain/domain.dart';

abstract class INotificationRepository {
  Future<List<CommunityNotification>> getNotifications();
}
