import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/theme.dart';

/// project header 정보
class ProjectHeaderInfo extends StatelessWidget {
  final ProjectEntity data;

  const ProjectHeaderInfo({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 카테고리
          if (data.type != null) ...[
            ProjectCategoryChip(type: data.type!),
            const Gap(16),
          ],

          // 프로젝트 제목
          Text(
            data.title ?? "제목 없음",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const Gap(8),

          // 메이커 정보
          if (data.owner != null) ...[
            Text(
              "by ${data.owner}",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.wavizGray[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(16),
          ],

          // 상태 및 기간
          ProjectStatusInfo(data: data),
        ],
      ),
    );
  }
}

/// 프로젝트 카테고리 칩
class ProjectCategoryChip extends StatelessWidget {
  final String type;

  const ProjectCategoryChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            type,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const Gap(4),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.primary,
            size: 16,
          ),
        ],
      ),
    );
  }
}

/// 프로젝트 상태 정보
class ProjectStatusInfo extends StatelessWidget {
  final ProjectEntity data;

  const ProjectStatusInfo({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = data.isOpen == "open";
    final daysLeft = _calculateDaysLeft();

    return Row(
      children: [
        // 프로젝트 상태
        ProjectStatusChip(
          text: isOpen ? "진행중" : "준비중",
          isActive: isOpen,
        ),
        const Gap(12),

        // 남은 기간
        if (daysLeft != null) ...[
          ProjectDaysLeftChip(daysLeft: daysLeft),
        ],
      ],
    );
  }

  int? _calculateDaysLeft() {
    if (data.deadline == null) return null;

    try {
      final deadline = DateTime.parse(data.deadline!);
      final now = DateTime.now();
      return deadline.difference(now).inDays;
    } catch (e) {
      return null;
    }
  }
}

/// 프로젝트 상태 칩
class ProjectStatusChip extends StatelessWidget {
  final String text;
  final bool isActive;

  const ProjectStatusChip({
    super.key,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.wavizGray[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : AppColors.wavizGray[700],
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

/// 남은 기간 칩
class ProjectDaysLeftChip extends StatelessWidget {
  final int daysLeft;

  const ProjectDaysLeftChip({
    super.key,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        daysLeft > 0 ? "$daysLeft일 남음" : "마감",
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

/// 펀딩 진행 현황
class ProjectFundingProgress extends StatelessWidget {
  final ProjectEntity data;

  const ProjectFundingProgress({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final totalFunded = data.totalFunded ?? 0;
    final targetAmount = data.price ?? 1;
    final achievementRate = (totalFunded / targetAmount * 100).clamp(0.0, 999.0);
    final fundedCount = data.totalFundedCount ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "펀딩 현황",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(16),

          // 달성률
          FundingAchievementRate(achievementRate: achievementRate),
          const Gap(16),

          // 펀딩 금액
          FundingAmount(
            totalFunded: totalFunded,
            targetAmount: targetAmount,
          ),
          const Gap(12),

          // 참여자 수
          FundingParticipants(fundedCount: fundedCount),
          const Gap(20),

          // 진행률 바
          FundingProgressBar(achievementRate: achievementRate),
        ],
      ),
    );
  }
}

/// 펀딩 달성률 표시
class FundingAchievementRate extends StatelessWidget {
  final double achievementRate;

  const FundingAchievementRate({
    super.key,
    required this.achievementRate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${NumberFormat('#,###').format(achievementRate.round())}%",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            "달성",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.wavizGray[700],
            ),
          ),
        ),
      ],
    );
  }
}

/// 펀딩 금액 표시
class FundingAmount extends StatelessWidget {
  final int totalFunded;
  final int targetAmount;

  const FundingAmount({
    super.key,
    required this.totalFunded,
    required this.targetAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${NumberFormat('#,###').format(totalFunded)}원",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(8),
        Text(
          "/ ${NumberFormat('#,###').format(targetAmount)}원",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.wavizGray[600],
          ),
        ),
      ],
    );
  }
}

/// 펀딩 참여자 수 표시
class FundingParticipants extends StatelessWidget {
  final int fundedCount;

  const FundingParticipants({
    super.key,
    required this.fundedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "${NumberFormat('#,###').format(fundedCount)}명 참여",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// 펀딩 진행률 바
class FundingProgressBar extends StatelessWidget {
  final double achievementRate;

  const FundingProgressBar({
    super.key,
    required this.achievementRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.wavizGray[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: (achievementRate / 100).clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

/// 프로젝트 스토리 섹션
class ProjectStorySection extends StatelessWidget {
  final ProjectEntity data;

  const ProjectStorySection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "프로젝트 스토리",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(16),

          // 프로젝트 설명
          if (data.description != null) ...[
            ProjectDescriptionCard(description: data.description!),
            const Gap(20),
          ],

          // 배송 안내
          const ProjectShippingNotice(),
          const Gap(20),

          // 프로젝트 이미지
          const ProjectStoryImage(),
        ],
      ),
    );
  }
}

/// 프로젝트 설명 카드
class ProjectDescriptionCard extends StatelessWidget {
  final String description;

  const ProjectDescriptionCard({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.wavizGray[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 20,
              ),
              const Gap(8),
              const Text(
                "프로젝트 소개",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Gap(12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.wavizGray[700],
            ),
          ),
        ],
      ),
    );
  }
}

/// 배송 안내 카드
class ProjectShippingNotice extends StatelessWidget {
  const ProjectShippingNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFB74D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                color: Color(0xFFFF8F00),
                size: 20,
              ),
              Gap(8),
              Text(
                "배송 안내",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFFFF8F00),
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            "도서산간에 해당하는 서포터님은 배송 가능 여부를\n반드시 메이커에게 문의 후 참여해주세요.",
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              color: AppColors.wavizGray[700],
            ),
          ),
        ],
      ),
    );
  }
}

/// 프로젝트 스토리 이미지
class ProjectStoryImage extends StatelessWidget {
  const ProjectStoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/image/advertising_image.png",
        width: double.infinity,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.wavizGray[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: AppColors.wavizGray[400],
                  ),
                  const Gap(8),
                  Text(
                    "이미지를 불러올 수 없습니다",
                    style: TextStyle(
                      color: AppColors.wavizGray[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 구분선 위젯
class ProjectDivider extends StatelessWidget {
  const ProjectDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      color: AppColors.bg,
      margin: const EdgeInsets.symmetric(vertical: 24),
    );
  }
}
