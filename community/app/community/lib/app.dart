import 'package:community/module/module.dart';
import 'package:community/widget/widget.dart';
import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tool_community_theme/theme.dart';

enum Phase {
  prod('http://10.0.2.2:8181', false),
  dev('http://10.0.2.2:8080', true);

  const Phase(this.baseUrl, this.debugShowCheckedModeBanner);

  final String baseUrl;
  final bool debugShowCheckedModeBanner;
}

Future<void> run(Phase phase) async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ICoreFirebase.initialize();
  await ICoreFirebaseRemoteConfig.initialize();
  await ICoreFirebaseRemoteConfig.fetchAndActivate();
  runApp(
    ModularApp(
      module: AppModule(baseUrl: phase.baseUrl),
      child: CommunityApp(
        debugShowCheckedModeBanner: phase.debugShowCheckedModeBanner,
      ),
    ),
  );
}

class CommunityApp extends StatefulWidget {
  const CommunityApp({super.key, this.debugShowCheckedModeBanner = false});

  final bool debugShowCheckedModeBanner;

  @override
  State<CommunityApp> createState() => _CommunityAppState();
}

class _CommunityAppState extends State<CommunityApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommunityTheme(
      themeData: CommunityThemeData.dark(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        routerConfig: Modular.routerConfig,
        builder: (context, child) => CommunityUriHandlerWidget(child: child!),
        // initialRoute: CommunityMainRoute.root.path,
        // onGenerateRoute: (settings) {
        //   final Uri uri = Uri.tryParse(settings.name ?? '') ?? Uri();
        //   final String path = uri.path;
        //
        //   final CommunityDetailRoute communityDetailRoute =
        //   CommunityDetailRoute.decode(path);
        //   if (communityDetailRoute != CommunityDetailRoute.unknown) {
        //     return ICommunityDetailRoutes.find(settings);
        //   }
        //
        //   final NotificationRoute notificationRoute = NotificationRoute.decode(
        //     path,
        //   );
        //   if (notificationRoute != NotificationRoute.unknown) {
        //     return INotificationRoutes.find(settings);
        //   }
        //
        //   final MyRoute myRoute = MyRoute.decode(path);
        //   if (myRoute != MyRoute.unknown) return IMyRoutes.find(settings);
        //
        //   final SearchRoute searchRoute = SearchRoute.decode(path);
        //   if (searchRoute != SearchRoute.unknown) {
        //     return ISearchRoutes.find(settings);
        //   }
        //
        //   return ICommunityMainRoutes.find(settings);
        // },
        themeMode: ThemeMode.dark,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('ko')],
      ),
    );
  }
}
