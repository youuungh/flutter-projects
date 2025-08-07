import 'package:core_bloc/bloc.dart';
import 'package:notification_domain/domain.dart';

class NotificationListCubit extends IFlowCubit<List<CommunityNotification>> {
  NotificationListCubit(this._getNotificationsUseCase);

  final GetNotificationsUseCase _getNotificationsUseCase;

  Future<void> load() async {
    emitLoading();

    try {
      final List<CommunityNotification> value = await _getNotificationsUseCase
          .execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
