import 'dart:async';

import 'package:core_util/util.dart';
import 'package:flutter/material.dart';

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