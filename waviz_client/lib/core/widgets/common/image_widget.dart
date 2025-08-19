import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 공통 network image 위젯
class CommonNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildErrorWidget();
    }

    Widget image = CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => 
          placeholder ?? _buildPlaceholder(),
      errorWidget: (context, url, error) => 
          errorWidget ?? _buildErrorWidget(),
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.wavizGray[100],
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: AppColors.wavizGray[100],
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.wavizGray[400],
          size: (width != null && height != null) 
              ? (width! + height!) / 8 
              : 32,
        ),
      ),
    );
  }
}

/// 프로젝트 썸네일 이미지
class ProjectThumbnail extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ProjectThumbnail({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CommonNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
    );
  }
}

/// hero section 배경 이미지
class HeroBackgroundImage extends StatelessWidget {
  final String? imageUrl;
  final Widget child;
  final Color? overlayColor;
  final double overlayOpacity;

  const HeroBackgroundImage({
    super.key,
    required this.imageUrl,
    required this.child,
    this.overlayColor,
    this.overlayOpacity = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.wavizGray[800],
        image: imageUrl?.isNotEmpty == true
            ? DecorationImage(
                image: CachedNetworkImageProvider(imageUrl!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  (overlayColor ?? Colors.black)
                      .withValues(alpha: overlayOpacity),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: imageUrl?.isNotEmpty != true
          ? Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        size: 64,
                        color: Colors.grey[600],
                      ),
                      const Gap(8),
                      Text(
                        "이미지가 없습니다",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                child,
              ],
            )
          : child,
    );
  }
}

/// avatar 이미지 (프로필용)
class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? fallbackText;
  final double radius;
  final Color? backgroundColor;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.fallbackText,
    this.radius = 24,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isNotEmpty == true) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: CachedNetworkImageProvider(imageUrl!),
        backgroundColor: backgroundColor ?? AppColors.bg,
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? AppColors.bg,
      child: Text(
        (fallbackText?.isNotEmpty == true)
            ? fallbackText![0].toUpperCase()
            : '?',
        style: TextStyle(
          fontSize: radius * 0.6,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}
