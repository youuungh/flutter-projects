import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waviz_client/theme.dart';

/// 아이콘 관련 유틸리티
class IconUtils {
  IconUtils._();

  /// 카테고리 탭 아이콘 생성
  static Widget buildTabIcon(dynamic tab, bool isSelected) {
    final iconColor = isSelected
        ? AppColors.primary
        : AppColors.wavizGray[500]!;

    // 전체, best, 신규, 인기는 무조건 Material Icon 사용
    switch (tab.type?.toLowerCase()) {
      case '전체':
      case 'all':
        return Icon(Icons.apps, size: 24, color: iconColor);
      case 'best':
      case '베스트':
      case 'best펀딩':
      case 'best 펀딩':
        return Icon(Icons.star, size: 24, color: iconColor);
      case '신규':
      case 'new':
        return Icon(Icons.new_releases, size: 24, color: iconColor);
      case '인기':
      case 'popular':
        return Icon(Icons.trending_up, size: 24, color: iconColor);
    }

    // 나머지는 SVG 시도 후 fallback
    if (tab.imagePath != null && tab.imagePath!.isNotEmpty) {
      return SvgPicture.asset(
        tab.imagePath!,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    }

    // 최후의 fallback
    return _getFallbackIcon(tab, iconColor);
  }

  /// 폴백 아이콘 생성
  static Widget _getFallbackIcon(dynamic tab, Color iconColor) {
    IconData iconData;
    switch (tab.type?.toLowerCase()) {
      case '패션':
        iconData = Icons.checkroom;
        break;
      case '뷰티':
        iconData = Icons.face;
        break;
      case '홈리빙':
        iconData = Icons.home;
        break;
      case '스포츠':
        iconData = Icons.sports;
        break;
      case '테크':
      case '기술':
        iconData = Icons.computer;
        break;
      case '푸드':
      case '음식':
        iconData = Icons.restaurant;
        break;
      default:
        iconData = Icons.category;
    }

    return Icon(iconData, size: 24, color: iconColor);
  }

  /// 프로젝트 상태 아이콘
  static IconData getProjectStatusIcon(String? status) {
    switch (status?.toLowerCase()) {
      case 'open':
        return Icons.play_circle_outline;
      case 'close':
      case 'closed':
        return Icons.pause_circle_outline;
      case 'ended':
        return Icons.check_circle_outline;
      default:
        return Icons.help_outline;
    }
  }

  /// 빈 상태 아이콘들
  static IconData getEmptyStateIcon(String type) {
    switch (type.toLowerCase()) {
      case 'project':
      case 'projects':
        return Icons.inbox_outlined;
      case 'favorite':
      case 'favorites':
        return Icons.favorite_border;
      case 'category':
      case 'categories':
        return Icons.category_outlined;
      case 'search':
        return Icons.search_off;
      case 'notification':
      case 'notifications':
        return Icons.notifications_none;
      case 'user':
      case 'profile':
        return Icons.person_outline;
      case 'error':
        return Icons.error_outline;
      default:
        return Icons.inbox_outlined;
    }
  }

  /// 로딩 상태별 크기
  static double getLoadingSize(String size) {
    switch (size.toLowerCase()) {
      case 'small':
        return 16;
      case 'medium':
        return 24;
      case 'large':
        return 32;
      case 'xlarge':
        return 48;
      default:
        return 24;
    }
  }
}

/// 공통 아이콘 위젯들
class CommonIcons {
  CommonIcons._();

  /// 즐겨찾기 아이콘
  static Widget favorite({bool isFilled = false, Color? color}) {
    return Icon(
      isFilled ? Icons.favorite : Icons.favorite_border,
      color: color ?? (isFilled ? Colors.red : AppColors.wavizGray[400]),
      size: 20,
    );
  }

  /// 검색 아이콘
  static Widget search({Color? color}) {
    return Icon(
      Icons.search,
      color: color ?? AppColors.wavizGray[600],
      size: 24,
    );
  }

  /// 알림 아이콘
  static Widget notification({Color? color}) {
    return Icon(
      Icons.notifications_none,
      color: color ?? AppColors.wavizGray[600],
      size: 28,
    );
  }

  /// 더보기 아이콘
  static Widget more({Color? color}) {
    return Icon(
      Icons.more_vert,
      color: color ?? AppColors.wavizGray[600],
      size: 24,
    );
  }

  /// 뒤로가기 아이콘
  static Widget back({Color? color}) {
    return Icon(
      Icons.arrow_back,
      color: color ?? Colors.black,
      size: 24,
    );
  }

  /// 드롭다운 아이콘
  static Widget dropdown({Color? color}) {
    return Icon(
      Icons.keyboard_arrow_down,
      size: 16,
      color: color ?? AppColors.wavizGray[500],
    );
  }
}
