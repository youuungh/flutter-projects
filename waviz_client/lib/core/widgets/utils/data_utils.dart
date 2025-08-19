import 'package:intl/intl.dart';

/// 데이터 관련 유틸리티 함수들
class DataUtils {
  DataUtils._();

  /// 펀딩 금액 텍스트 생성
  static String getFundingAmountText(dynamic project) {
    final amount = project.totalFunded;

    // 실제 펀딩 금액이 있으면 그 금액을 표시
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

    // 펀딩 금액이 0이거나 null이면 더미 데이터 표시
    final dummyAmount = generateDummyFundingAmount(project);
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

  /// 더미 펀딩 금액 생성
  static int generateDummyFundingAmount(dynamic project) {
    final projectHash = (project.id?.toString() ?? project.title ?? "").hashCode
        .abs();
    final baseAmount = 100000 + (projectHash % 5000000); // 10만원 ~ 500만원 사이
    final multiplier = 1 + (projectHash % 20); // 1~20 배수
    return baseAmount * multiplier;
  }

  /// 참여자 수 텍스트 생성
  static String getParticipantCountText(dynamic project) {
    final count = project.totalFundedCount;

    // 실제 참여자가 있으면 그 숫자를 표시
    if (count != null && count > 0) {
      return "${NumberFormat("###,###,###").format(count)}명 참여";
    }

    // 참여자 수가 0이거나 null이면 프로젝트에 따라 더미 데이터 표시
    final dummyCount = generateDummyParticipantCount(project);
    return "${NumberFormat("###,###,###").format(dummyCount)}명 참여";
  }

  /// 더미 참여자 수 생성
  static int generateDummyParticipantCount(dynamic project) {
    final titleHash = (project.title ?? "").hashCode.abs();
    final baseCount = 50 + (titleHash % 500); // 50~550 사이
    final multiplier = 1 + (titleHash % 10); // 1~10 배수
    return baseCount * multiplier;
  }

  /// 숫자 포맷팅 (천 단위 콤마)
  static String formatNumber(int? number) {
    if (number == null) return "0";
    return NumberFormat('###,###,###,###').format(number);
  }

  /// 간단한 금액 표시 (예: 1만원, 10만원)
  static String formatSimpleAmount(int amount) {
    if (amount >= 100000000) {
      return "${(amount / 100000000).toStringAsFixed(0)}억원";
    } else if (amount >= 10000) {
      return "${(amount / 10000).toStringAsFixed(0)}만원";
    } else {
      return "${NumberFormat('#,###').format(amount)}원";
    }
  }

  /// 프로젝트 상태 텍스트
  static String getProjectStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case 'open':
        return '진행중';
      case 'close':
      case 'closed':
        return '준비중';
      case 'ended':
        return '종료됨';
      default:
        return '알 수 없음';
    }
  }

  /// 프로젝트 상태 색상
  static bool isProjectOpen(String? status) {
    return status?.toLowerCase() == 'open';
  }
}

/// 텍스트 관련 유틸리티
class TextUtils {
  TextUtils._();

  /// 텍스트 자르기
  static String truncateText(String? text, int maxLength) {
    if (text == null || text.isEmpty) return '';
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// 빈 텍스트 처리
  static String getDisplayText(String? text, String fallback) {
    return (text?.isNotEmpty == true) ? text! : fallback;
  }

  /// 첫 글자 대문자로 변환
  static String capitalizeFirst(String? text) {
    if (text == null || text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }
}
