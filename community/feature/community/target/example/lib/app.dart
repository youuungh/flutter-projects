import 'package:core_util/util.dart';
import 'package:feature_community_example/module/module.dart';
import 'package:feature_community_example/widget/uri_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tool_community_theme/theme.dart';

enum Phase {
  prod('http://10.0.2.2:8181', false),
  dev('http://10.0.2.2:8080', true);

  const Phase(this.baseUrl, this.debugShowCheckedModeBanner);

  final String baseUrl;
  final bool debugShowCheckedModeBanner;
}

Future<void> run(Phase phase) async {
  runApp(
    ModularApp(
      module: AppModule(baseUrl: phase.baseUrl),
      child: CommunityModuleTestApp(
        debugShowCheckedModeBanner: phase.debugShowCheckedModeBanner,
      ),
    ),
  );
}

class CommunityModuleTestApp extends StatefulWidget {
  const CommunityModuleTestApp({super.key, this.debugShowCheckedModeBanner = false});

  final bool debugShowCheckedModeBanner;

  @override
  State<CommunityModuleTestApp> createState() => _CommunityAppState();
}

class _CommunityAppState extends State<CommunityModuleTestApp> {
  @override
  Widget build(BuildContext context) {
    return CommunityTheme(
      themeData: CommunityThemeData.dark(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        routerConfig: Modular.routerConfig,
        builder: (context, child) => CommunityUriHandlerWidget(child: child!),
        themeMode: ThemeMode.dark,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('ko')],
      ),
    );
  }
}
