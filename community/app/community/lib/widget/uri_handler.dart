import 'dart:async';

import 'package:core_util/util.dart';
import 'package:feature_community/community.dart';
import 'package:feature_my/community.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CommunityUriHandlerWidget extends StatefulWidget {
  const CommunityUriHandlerWidget({required this.child, super.key});

  final Widget child;

  @override
  State<CommunityUriHandlerWidget> createState() =>
      _CommunityUriHandlerWidgetState();
}

class _CommunityUriHandlerWidgetState extends State<CommunityUriHandlerWidget> {
  StreamSubscription<RouteEvent>? _routeEventSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subscribeRouteEvent();
    });
    super.initState();
  }

  @override
  void dispose() {
    _unsubscribeRouteEvent();
    super.dispose();
  }

  void _subscribeRouteEvent() {
    _routeEventSubscription = Modular.get<EventBus>().on<RouteEvent>().listen((
      event,
    ) {
      _open(event.route);
    });
  }

  void _unsubscribeRouteEvent() {
    _routeEventSubscription?.cancel();
    _routeEventSubscription = null;
  }

  Future<void> _open(String route) async {
    final Uri uri = Uri.tryParse(route) ?? Uri();

    int? tabIndex;
    if (uri.path == CommunityDetailRoute.community.path) {
      // tabIndex = 0;
      tabIndex = switch (uri.queryParameters['type'] ?? '') {
        'popular' => 2,
        _ => 0,
      };
    } else if (uri.path == MyRoute.my.path) {
      tabIndex = 3;
    }

    // if (tabIndex != null) {
    //   Modular.get<EventBus>().fire(HomeTabEvent(tabIndex));
    //
    //   if (tabIndex == 0) {
    //     final int nestedTabIndex = switch (uri.queryParameters['type'] ?? '') {
    //       'popular' => 1,
    //       _ => 0,
    //     };
    //     Modular.get<EventBus>().fire(CommunityNestedTabEvent(nestedTabIndex));
    //   }
    //
    //   return;
    // }

    if (tabIndex != null) {
      Modular.get<EventBus>().fire(HomeTabEvent(tabIndex));
      return;
    }

    await Modular.to.pushNamed(
      uri.path,
      arguments: {
        ...uri.queryParameters,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
