import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:waviz_client/core/widgets/dialogs/dialogs.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/favorite/favorite_notifier.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

/// 프로젝트 카드 위젯 (리스트용)
class ProjectCard extends ConsumerWidget {
  final dynamic project;
  final bool showFavorite;

  const ProjectCard({
    super.key,
    required this.project,
    this.showFavorite = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.push("/detail", extra: json.encode(project.toJson()));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.wavizGray[100]!, width: 1),
        ),
        child: Row(
          children: [
            _ProjectImage(project: project),
            const Gap(16),
            Expanded(
              child: _ProjectInfo(project: project),
            ),
            if (showFavorite)
              _FavoriteButton(project: project)
            else
              _FavoriteToggleButton(project: project),
          ],
        ),
      ),
    );
  }
}

/// 프로젝트 이미지 부분
class _ProjectImage extends StatelessWidget {
  final dynamic project;

  const _ProjectImage({required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 100,
        width: 140,
        decoration: BoxDecoration(color: AppColors.wavizGray[100]),
        child: project.thumbnail != null && project.thumbnail!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: project.thumbnail!,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: AppColors.wavizGray[100]),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.wavizGray[100],
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.wavizGray[400],
                    size: 32,
                  ),
                ),
              )
            : Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.wavizGray[400],
                size: 32,
              ),
      ),
    );
  }
}

/// 프로젝트 정보 부분
class _ProjectInfo extends StatelessWidget {
  final dynamic project;

  const _ProjectInfo({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title ?? "제목 없음",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.wavizGray[800],
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          project.owner ?? "작성자 미상",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.wavizGray[500],
          ),
        ),
        const Gap(8),
        Text(
          _getParticipantCountText(project),
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const Gap(8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            _getFundingAmountText(project),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.wavizGray[700],
            ),
          ),
        ),
      ],
    );
  }

  String _getFundingAmountText(project) {
    final amount = project.totalFunded;

    if (amount != null && amount > 0) {
      return switch (amount) {
        >= 100000000 =>
          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(amount ~/ 100000000)}억 원+",
        >= 10000000 =>
          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(amount ~/ 10000000)}천만 원+",
        >= 10000 =>
          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(amount ~/ 10000)}만 원+",
        _ =>
          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(amount)}원",
      };
    }

    final dummyAmount = _generateDummyFundingAmount(project);
    return switch (dummyAmount) {
      >= 100000000 =>
        "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(dummyAmount ~/ 100000000)}억 원+",
      >= 10000000 =>
        "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(dummyAmount ~/ 10000000)}천만 원+",
      >= 10000 =>
        "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(dummyAmount ~/ 10000)}만 원+",
      _ =>
        "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(dummyAmount)}원",
    };
  }

  int _generateDummyFundingAmount(project) {
    final projectHash = (project.id?.toString() ?? project.title ?? "").hashCode
        .abs();
    final baseAmount = 100000 + (projectHash % 5000000);
    final multiplier = 1 + (projectHash % 20);
    return baseAmount * multiplier;
  }

  String _getParticipantCountText(project) {
    final count = project.totalFundedCount;

    if (count != null && count > 0) {
      return "${NumberFormat("###,###,###").format(count)}명 참여";
    }

    final dummyCount = _generateDummyParticipantCount(project);
    return "${NumberFormat("###,###,###").format(dummyCount)}명 참여";
  }

  int _generateDummyParticipantCount(project) {
    final titleHash = (project.title ?? "").hashCode.abs();
    final baseCount = 50 + (titleHash % 500);
    final multiplier = 1 + (titleHash % 10);
    return baseCount * multiplier;
  }
}

/// 즐겨찾기 삭제 버튼 (즐겨찾기 페이지용)
class _FavoriteButton extends ConsumerWidget {
  final dynamic project;

  const _FavoriteButton({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final confirmed = await WavizDialog.confirm(
          context: context,
          title: "구독 취소",
          message: "구독을 취소할까요?",
          confirmText: "확인",
          cancelText: "취소",
          isDestructive: false,
        );

        if (confirmed == true) {
          ref.read(favoriteNotifierProvider.notifier).removeItem(project);
        }
      },
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}

/// 즐겨찾기 토글 버튼 (일반 페이지용)
class _FavoriteToggleButton extends ConsumerWidget {
  final dynamic project;

  const _FavoriteToggleButton({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteNotifierProvider);
    final isFavorite = favorites.favoriteProjects.any(
      (element) => element.id == project.id,
    );

    return IconButton(
      onPressed: () async {
        final loginState = ref.read(loginNotifierProvider);
        if (!loginState.isLogin) {
          final goToLogin = await WavizDialog.loginRequired(
            context: context,
            title: "로그인 필요",
            message: "관심 프로젝트 기능을 사용하려면\n로그인이 필요합니다.",
          );

          if (goToLogin == true && context.mounted) {
            context.push("/login");
          }
          return;
        }

        if (isFavorite) {
          final confirmed = await WavizDialog.confirm(
            context: context,
            title: "구독 취소",
            message: "구독을 취소할까요?",
            confirmText: "확인",
            cancelText: "취소",
            isDestructive: false,
          );

          if (confirmed == true) {
            ref.read(favoriteNotifierProvider.notifier).removeItem(project);
          }
        } else {
          ref.read(favoriteNotifierProvider.notifier).addItem(project);
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : AppColors.wavizGray[400],
        size: 20,
      ),
    );
  }
}
