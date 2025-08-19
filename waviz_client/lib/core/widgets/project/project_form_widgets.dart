import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:waviz_client/core/enum/enum_project_class.dart';
import 'package:waviz_client/theme.dart';

/// 프로젝트 폼 섹션 래퍼
class ProjectFormSection extends StatelessWidget {
  final String title;
  final bool isRequired;
  final IconData icon;
  final String? description;
  final Widget child;
  final bool isLast;

  const ProjectFormSection({
    super.key,
    required this.title,
    required this.isRequired,
    required this.icon,
    this.description,
    required this.child,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, isLast ? 16 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 16, color: AppColors.wavizGray[600]),
              ),
              const Gap(8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.wavizGray[800],
                ),
              ),
              if (isRequired) ...[
                const Gap(4),
                Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
          if (description != null) ...[
            const Gap(8),
            Text(
              description!,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.wavizGray[500],
                height: 1.4,
              ),
            ),
          ],
          const Gap(16),
          child,
        ],
      ),
    );
  }
}

/// 프로젝트 유형 선택기
class ProjectTypeSelector extends StatelessWidget {
  final EnumProjectClass selectedType;
  final ValueChanged<EnumProjectClass> onTypeChanged;

  const ProjectTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.wavizGray[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: EnumProjectClass.values.asMap().entries.map((entry) {
          final index = entry.key;
          final type = entry.value;
          final isFirst = index == 0;
          final isLast = index == EnumProjectClass.values.length - 1;

          return Container(
            decoration: BoxDecoration(
              border: !isLast
                  ? Border(
                      bottom: BorderSide(
                        color: AppColors.wavizGray[100]!,
                        width: 1,
                      ),
                    )
                  : null,
              borderRadius: BorderRadius.only(
                topLeft: isFirst ? const Radius.circular(12) : Radius.zero,
                topRight: isFirst ? const Radius.circular(12) : Radius.zero,
                bottomLeft: isLast ? const Radius.circular(12) : Radius.zero,
                bottomRight: isLast ? const Radius.circular(12) : Radius.zero,
              ),
            ),
            child: RadioListTile<EnumProjectClass>(
              value: type,
              groupValue: selectedType,
              activeColor: AppColors.primary,
              onChanged: (value) {
                if (value != null) {
                  onTypeChanged(value);
                }
              },
              title: Text(
                type.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.wavizGray[800],
                ),
              ),
              subtitle: Text(
                type.subtitle ?? "",
                style: TextStyle(fontSize: 13, color: AppColors.wavizGray[600]),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// 가격 입력 필드
class PriceFormField extends StatelessWidget {
  final TextEditingController controller;

  const PriceFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "목표 금액을 입력해 주세요",
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
          return "목표 금액을 입력해주세요";
        }
        final amount = int.tryParse(value.replaceAll(',', ''));
        if (amount == null) {
          return "올바른 금액을 입력해주세요";
        }
        if (amount < 500000) {
          return "최소 금액은 50만원입니다";
        }
        if (amount > 100000000) {
          return "최대 금액은 1억원입니다";
        }
        return null;
      },
    );
  }
}

/// 프로젝트 제목 입력 필드
class ProjectTitleFormField extends StatelessWidget {
  final TextEditingController controller;

  const ProjectTitleFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "프로젝트 제목을 입력해 주세요",
        prefixIcon: Icon(Icons.title, color: AppColors.wavizGray[400]),
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
      maxLength: 40,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "프로젝트 제목을 입력해주세요";
        }
        if (value.trim().length < 5) {
          return "제목은 5글자 이상 입력해주세요";
        }
        return null;
      },
    );
  }
}

/// 메이커 이름 입력 필드
class MakerNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const MakerNameFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "메이커 명을 입력해 주세요",
        prefixIcon: Icon(Icons.person, color: AppColors.wavizGray[400]),
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
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "메이커 명을 입력해주세요";
        }
        return null;
      },
    );
  }
}

/// 프로젝트 설명 입력 필드
class ProjectDescriptionFormField extends StatelessWidget {
  final TextEditingController controller;

  const ProjectDescriptionFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "프로젝트를 간단히 소개해주세요",
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
      maxLines: 4,
      maxLength: 200,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "프로젝트 요약을 입력해주세요";
        }
        if (value.trim().length < 10) {
          return "요약은 10글자 이상 입력해주세요";
        }
        return null;
      },
    );
  }
}

/// 이미지 선택 위젯
class ProjectImageSelector extends StatelessWidget {
  final XFile? selectedImage;
  final VoidCallback onImagePicked;
  final VoidCallback? onImageRemoved;

  const ProjectImageSelector({
    super.key,
    this.selectedImage,
    required this.onImagePicked,
    this.onImageRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onImagePicked,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.wavizGray[200]!,
              style: BorderStyle.solid,
            ),
          ),
          child: selectedImage != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: FutureBuilder<Uint8List>(
                          future: selectedImage!.readAsBytes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (onImageRemoved != null)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: onImageRemoved,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.bg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 32,
                        color: AppColors.wavizGray[400],
                      ),
                    ),
                    const Gap(12),
                    Text(
                      "이미지 선택",
                      style: TextStyle(
                        color: AppColors.wavizGray[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      "선택사항",
                      style: TextStyle(
                        color: AppColors.wavizGray[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// 프로젝트 저장 버튼
class ProjectSaveButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;

  const ProjectSaveButton({
    super.key,
    required this.isLoading,
    this.onPressed,
    this.text = "프로젝트 생성",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading
              ? AppColors.wavizGray[300]
              : AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  const Gap(12),
                  const Text(
                    "프로젝트 생성 중...",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.rocket_launch, size: 20),
                  const Gap(8),
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}

/// 천 단위 구분자 입력 포맷터
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int selectionIndex = newValue.selection.end;
    final String newText = newValue.text.replaceAll(',', '');

    if (newText.isEmpty) {
      return const TextEditingValue();
    }

    final String formattedText = NumberFormat(
      '#,###',
    ).format(int.parse(newText));
    final int newSelectionIndex =
        selectionIndex + (formattedText.length - newValue.text.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: newSelectionIndex.clamp(0, formattedText.length),
      ),
    );
  }
}
