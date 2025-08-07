import 'dart:async';

import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';

// import 'package:feature_community/community.dart';
import 'package:feature_notification/community.dart';
import 'package:flutter/material.dart';
import 'package:notification_domain/domain.dart';
import 'package:notification_presentation/presentation.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  StreamSubscription<NotificationRefreshEvent>? _refreshEventSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subscribeRefreshEvent();
      _refresh();
    });
    super.initState();
  }

  @override
  void dispose() {
    _unsubscribeRefreshEvent();
    super.dispose();
  }

  void _subscribeRefreshEvent() {
    _refreshEventSubscription = Modular.get<EventBus>()
        .on<NotificationRefreshEvent>()
        .listen((_) {
          _refresh();
        });
  }

  void _unsubscribeRefreshEvent() {
    _refreshEventSubscription?.cancel();
    _refreshEventSubscription = null;
  }

  Future<void> _refresh() async {
    await context.readFlowBloc<NotificationListCubit>().load();
  }

  // void _onNotificationTap(CommunityNotification notification) {
  //   final Uri uri = Uri.tryParse(notification.route) ?? Uri();
  //
  //   if (uri.path == CommunityDetailRoute.post.path) {
  //     final String postId = uri.queryParameters['id'] ?? '';
  //     if (postId.isNotEmpty) {
  //       ICommunityDetailRouteTo.post(
  //         // context,
  //         id: postId,
  //       );
  //     }
  //   }
  //
  //   // 다른 타입의 알림들 추가
  //   // else if (uri.path == CommunityRoute.community.path) {
  //   //   ICommunityRouteTo.community(context);
  //   // }
  // }

  void _onNotificationTap(String route) {
    Modular.get<EventBus>().fire(RouteEvent(route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      appBar: CommunityAppBar(
        context: context,
        leading: const CommunityAppBarBackButton(),
        title: CommunityAppBarTitle.simple(context, text: '알림'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.5),
            child: CommunityAppBarIconAction(
              icon: CommunityIcon.settings(color: context.colorScheme.gray300),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: CommunityDivider.horizontal(),
        ),
      ),
      body: CoreRefreshIndicator(
        onRefresh: _refresh,
        indicator: CommunityIcon.restartAlt(color: context.colorScheme.gray600),
        child: CoreLoadMore(
          onLoadMore: () async {},
          child:
              FlowBlocBuilder<
                NotificationListCubit,
                List<CommunityNotification>
              >(
                builder: (context, state) {
                  final List<CommunityNotification> items = state.data ?? [];
                  return ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final CommunityNotification item = items[index];
                      return NotificationTile.item(
                        item,
                        onTap: () => _onNotificationTap(
                          item.route,
                        ), // _onNotificationTap(item),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        CommunityDivider.horizontal(),
                  );
                },
              ),
        ),
      ),
    );
  }
}
