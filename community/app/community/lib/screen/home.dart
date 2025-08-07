import 'dart:async';

import 'package:community/route/route.dart';
import 'package:community/screen/screen.dart';
import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_community/community.dart';
import 'package:feature_my/community.dart';
import 'package:feature_notification/community.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<HomeTabEvent>? _homeTabEventSubscription;
  StreamSubscription<CommunityPostPopEvent>? _communityPostPopEventSubscription;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashScreen.show(context);
      _subscribeHomeTabEvent();
      _subscribeCommunityPostPopEvent();
    });
    super.initState();
  }

  @override
  void dispose() {
    _unsubscribeHomeTabEvent();
    _unsubscribeCommunityPostPopEvent();
    super.dispose();
  }

  void _subscribeHomeTabEvent() {
    _homeTabEventSubscription = Modular.get<EventBus>()
        .on<HomeTabEvent>()
        .listen((event) {
          context.readFlowBloc<HomeTabCubit>().change(index: event.index);
        });
  }

  void _subscribeCommunityPostPopEvent() {
    _communityPostPopEventSubscription = Modular.get<EventBus>()
        .on<CommunityPostPopEvent>()
        .listen((event) {
          Modular.get<EventBus>().fire(CommunityRefreshEvent());
          Modular.get<EventBus>().fire(NotificationRefreshEvent());
        });
  }

  void _unsubscribeHomeTabEvent() {
    _homeTabEventSubscription?.cancel();
    _homeTabEventSubscription = null;
  }

  void _unsubscribeCommunityPostPopEvent() {
    _communityPostPopEventSubscription?.cancel();
    _communityPostPopEventSubscription = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      body: FlowBlocBuilder<HomeTabCubit, int>.when(
        data: (context, state) => CoreTabSwitchingView(
          currentTabIndex: state.data,
          tabCount: CommunityNavigationType.values.length,
          tabBuilder: (context, index) {
            final Widget screen = switch (index) {
              // 0 => ICommunityDetailRoutes.findScreen(
              //   Uri(
              //     path: CommunityDetailRoute.community.path,
              //     queryParameters: {'type': 'normal'},
              //   ),
              // ),
              0 => ICommunityDetailRoutes.find(
                Uri(
                  path: CommunityDetailRoute.community.path,
                  queryParameters: {'type': 'normal'},
                ),
              ),
              // 2 => ICommunityDetailRoutes.findScreen(
              //   Uri(
              //     path: CommunityDetailRoute.community.path,
              //     queryParameters: {'type': 'popular'},
              //   ),
              // ),
              2 => ICommunityDetailRoutes.find(
                Uri(
                  path: CommunityDetailRoute.community.path,
                  queryParameters: {'type': 'popular'},
                ),
              ),
              // 3 => IMyRoutes.findScreen(Uri(path: MyRoute.my.path)),
              3 => IMyRoutes.find(Uri(path: MyRoute.my.path)),
              // _ => ICommunityMainRoutes.findScreen(
              //   Uri(path: CommunityMainRoute.unknown.path),
              // ),
              _ => ICommunityMainRoutes.find(
                Uri(path: CommunityMainRoute.unknown.path),
              ),
            };
            return screen;
          },
        ),
      ),
      bottomNavigationBar: FlowBlocBuilder<HomeTabCubit, int>.when(
        data: (context, state) => CommunityBottomNavigationBar(
          items: CommunityNavigationType.values
              .map((e) => CommunityBottomNavigationItem(type: e))
              .toList(),
          currentIndex: state.data,
          onTap: (index) {
            if (index == CommunityNavigationType.write.index) {
              ICommunityDetailRouteTo.write();
              return;
            }
            context.readFlowBloc<HomeTabCubit>().change(index: index);
          },
        ),
      ),
      // floatingActionButton: FlowBlocBuilder<HomeTabCubit, int>.when(
      //   data: (context, state) {
      //     switch (state.data) {
      //       case 0:
      //       case 1:
      //         return const CommunityWriteButton(
      //           onTap: ICommunityDetailRouteTo
      //               .write, // ICommunityDetailRouteTo.write(context),
      //         );
      //       default:
      //         return const SizedBox.shrink();
      //     }
      //   },
      // ),
    );
  }
}
