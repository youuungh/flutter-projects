//import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:my_domain/domain.dart';
import 'package:my_presentation/presentation.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';
import 'package:feature_my/community.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
    super.initState();
  }

  Future<void> _refresh() async {
    //await context.readFlowBloc<MyCubit>().load();
    await Provider.of<MyViewModel>(context, listen: false).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      appBar: CommunityAppBar(
        context: context,
        title: CommunityAppBarTitle.simple(context, text: '마이페이지'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.5),
            child: CommunityAppBarIconAction(
              icon: CommunityIcon.logout(color: context.colorScheme.gray300),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: CommunityDivider.horizontal(),
        ),
      ),
      body: SizedBox.expand(
        child: CustomScrollView(
          slivers: [
            // FlowBlocBuilder<MyCubit, User>(
            //   builder: (context, state) {
            //     final User user = state.data ?? const User();
            //     return SliverToBoxAdapter(
            //       child: MyProfileCard.item(user, onModify: () {}),
            //     );
            //   },
            // ),
            Consumer<MyViewModel>(
              builder: (context, viewModel, child) {
                final User user = viewModel.value ?? const User();
                return SliverToBoxAdapter(
                  child: MyProfileCard.item(user, onModify: () {}),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
            SliverList.list(
              children: [
                CommunitySettingTile.simple(
                  context,
                  title: '로그인',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
              ],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
            SliverList.list(
              children: [
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.mail(color: ColorName.mainRed),
                  title: '알림 설정',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.featuredSeasonalAndGifts(
                    color: ColorName.mainRed,
                  ),
                  title: '이벤트 & 혜택',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.volunteerActivism(
                    color: ColorName.mainRed,
                  ),
                  title: '사람 찾기',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
              ],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
            SliverList.list(
              children: [
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.sourceEnvironment(
                    color: ColorName.mainRed,
                  ),
                  title: '커뮤니티 가이드',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.payments(color: ColorName.mainRed),
                  title: '포인트 & 등급',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
                CommunitySettingTile.icon(
                  context,
                  icon: CommunityIcon.doNotDisturbOn(color: ColorName.mainRed),
                  title: '키워드 글 숨기기',
                  onTap: () {},
                ),
                CommunityDivider.horizontal(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
