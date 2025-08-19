import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/theme.dart';

/// 프로젝트 정보 위젯
class ProjectInfoWidget extends StatelessWidget {
  final String projectId;

  const ProjectInfoWidget({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.wavizGray[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.folder_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "프로젝트 ID: $projectId",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.wavizGray[800],
                  ),
                ),
                const Gap(4),
                Text(
                  "이 프로젝트에 리워드를 추가합니다",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.wavizGray[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 리워드 이미지 선택기
class RewardImageSelector extends StatelessWidget {
  final List<XFile> selectedImages;
  final VoidCallback onAddImages;
  final ValueChanged<int> onRemoveImage;

  const RewardImageSelector({
    super.key,
    required this.selectedImages,
    required this.onAddImages,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이미지 추가 버튼
        if (selectedImages.length < 5)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onAddImages,
              borderRadius: BorderRadius.circular(12),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.wavizGray[300]!,
                  dashPattern: const [8, 4],
                  radius: const Radius.circular(10),
                ),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: AppColors.bg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate,
                        size: 32,
                        color: AppColors.wavizGray[400],
                      ),
                      const Gap(8),
                      Text(
                        "이미지 추가 (${selectedImages.length}/5)",
                        style: TextStyle(
                          color: AppColors.wavizGray[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        "탭하여 갤러리에서 선택",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.wavizGray[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        // 선택된 이미지들
        if (selectedImages.isNotEmpty) ...[
          const Gap(16),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: selectedImages.length,
              separatorBuilder: (context, index) => const Gap(12),
              itemBuilder: (context, index) {
                final image = selectedImages[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: FutureBuilder<Uint8List>(
                          future: image.readAsBytes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            }
                            return Container(
                              color: AppColors.wavizGray[200],
                              child: Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => onRemoveImage(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

/// 리워드 가격 입력 필드
class RewardPriceFormField extends StatelessWidget {
  final TextEditingController controller;

  const RewardPriceFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "리워드 금액을 입력해 주세요",
        suffixText: "원",
        suffixStyle: TextStyle(
          color: AppColors.wavizGray[600],
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(Icons.attach_money, color: AppColors.wavizGray[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsSeparatorInputFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "리워드 금액을 입력해주세요";
        }
        final amount = int.tryParse(value.replaceAll(',', ''));
        if (amount == null) {
          return "올바른 금액을 입력해주세요";
        }
        if (amount < 1000) {
          return "최소 금액은 1,000원입니다";
        }
        if (amount > 10000000) {
          return "최대 금액은 1,000만원입니다";
        }
        return null;
      },
    );
  }
}

/// 리워드 제목 입력 필드
class RewardTitleFormField extends StatelessWidget {
  final TextEditingController controller;

  const RewardTitleFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "리워드명을 입력해 주세요",
        prefixIcon: Icon(Icons.card_giftcard, color: AppColors.wavizGray[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      maxLength: 50,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "리워드명을 입력해주세요";
        }
        if (value.trim().length < 3) {
          return "리워드명은 3글자 이상 입력해주세요";
        }
        return null;
      },
    );
  }
}

/// 리워드 설명 입력 필드
class RewardDescriptionFormField extends StatelessWidget {
  final TextEditingController controller;

  const RewardDescriptionFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "리워드 구성과 혜택을 자세히 설명해주세요",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.wavizGray[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        alignLabelWithHint: true,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      maxLines: 5,
      maxLength: 500,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "리워드 설명을 입력해주세요";
        }
        if (value.trim().length < 20) {
          return "설명은 20글자 이상 입력해주세요";
        }
        return null;
      },
    );
  }
}

/// 리워드 미리보기 카드
class RewardPreviewCard extends StatelessWidget {
  final String title;
  final int price;
  final String description;
  final List<XFile>? images;

  const RewardPreviewCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.wavizGray[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.preview,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              const Gap(8),
              Text(
                "미리보기",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.wavizGray[700],
                ),
              ),
            ],
          ),
          const Gap(16),

          // 이미지 (있는 경우)
          if (images != null && images!.isNotEmpty) ...[
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images!.length,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FutureBuilder<Uint8List>(
                        future: images![index].readAsBytes(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          }
                          return Container(
                            color: AppColors.wavizGray[200],
                            child: Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(16),
          ],

          // 가격
          Text(
            DataUtils.formatSimpleAmount(price),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const Gap(8),

          // 제목
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.wavizGray[800],
            ),
          ),
          const Gap(8),

          // 설명
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.wavizGray[600],
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// 리워드 액션 버튼들
class RewardActionButtons extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const RewardActionButtons({
    super.key,
    required this.isLoading,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlineButton(
            text: "취소",
            onPressed: isLoading ? null : onCancel,
            borderColor: AppColors.wavizGray[300],
            textColor: AppColors.wavizGray[600],
          ),
        ),
        const Gap(12),
        Expanded(
          flex: 2,
          child: PrimaryButton(
            text: "리워드 추가",
            isLoading: isLoading,
            onPressed: onSave,
          ),
        ),
      ],
    );
  }
}
