import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_component/gen/gen.dart';

class CommunityIcon extends StatelessWidget {
  const CommunityIcon({
    required this.icon,
    super.key,
    this.color,
    this.size,
  });

  factory CommunityIcon.arrowBack({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icArrowBack,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.bookmark({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icBookmark,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.cancel({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icCancel,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.chatBubble({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icChatBubble,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.chevronRight({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icChevronRight,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.circleNotifications({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icCircleNotifications,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.close({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icClose,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.doNotDisturbOn({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icDoNotDisturbOn,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.edit({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icEdit,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.expandMore({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icExpandMore,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.favorite({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icFavorite,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.featuredSeasonalAndGifts({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icFeaturedSeasonalAndGifts,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.filterNone({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icFilterNone,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.flagCircle({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icFlagCircle,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.homeOff({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icHomeOff,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.homeOn({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icHomeOn,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.imagesMode({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icImagesMode,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.logo({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icLogo,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.logoSmall({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icLogoSmall,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.logout({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icLogout,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.mail({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icMail,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.moreHoriz({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icMoreHoriz,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.notificationsOff({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icNotificationsOff,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.notificationsOn({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icNotificationsOn,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.messageOff({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icSmsOff,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.messageOn({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icSmsOn,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.payments({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icPayments,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.personOff({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icPersonOff,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.personOn({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icPersonOn,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.restartAlt({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icRestartAlt,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.search({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icSearch,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.settings({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icSettings,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.notification({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icNotificationsOff,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.sourceEnvironment({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icSourceEnvironment,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.upload({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icUpload,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.visibility({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icVisibility,
      color: color,
      size: size,
    );
  }

  factory CommunityIcon.volunteerActivism({Color? color, double? size}) {
    return CommunityIcon(
      icon: Assets.images.svgs.icVolunteerActivism,
      color: color,
      size: size,
    );
  }

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CommunitySvgPicture.asset(
      icon,
      color: color,
      width: size,
      height: size,
    );
  }
}

class CommunitySvgPicture extends CoreSvgPicture {
  CommunitySvgPicture.asset(
    super.assetName, {
    super.key,
    super.matchTextDirection,
    super.bundle,
    super.package = kToolCommunityComponentPackageName,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.theme,
    super.colorFilter,
    super.color,
    super.colorBlendMode,
    super.cacheColorFilter,
  }) : super.asset();
}
