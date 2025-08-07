import 'package:core_util/util.dart';
import 'package:notification_domain/domain.dart';

class GetNotificationsUseCase
    implements IUseCase<List<CommunityNotification>, void> {
  GetNotificationsUseCase(this._notificationRepository);

  final INotificationRepository _notificationRepository;

  @override
  Future<List<CommunityNotification>> execute([void params]) {
    return _notificationRepository.getNotifications();
  }
}
