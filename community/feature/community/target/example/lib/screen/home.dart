import 'package:feature_community/community.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      body: ICommunityDetailRoutes.findScreen(
        Uri(path: CommunityDetailRoute.community.path),
      ),
      floatingActionButton: const CommunityWriteButton(
        onTap: ICommunityDetailRouteTo
            .write,
      ),
    );
  }
}
