import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:waviz_client/core/enum/enum_project_class.dart';
import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';
import 'package:waviz_client/presentation/notifiers/project/project_notifier.dart';

class AddProjectPage extends ConsumerStatefulWidget {
  const AddProjectPage({super.key});

  @override
  ConsumerState<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends ConsumerState<AddProjectPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EnumProjectClass enumProjectClass = EnumProjectClass.funding;
  final TextEditingController priceTextEditingController = TextEditingController();
  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController makerTextEditingController = TextEditingController();
  final TextEditingController deadlineTextEditingController = TextEditingController();
  final TextEditingController descriptionTextEditingController = TextEditingController();

  ProjectType? projectType;
  XFile? image;
  bool _isCreating = false;

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    makerTextEditingController.dispose();
    deadlineTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectState = ref.watch(projectNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "프로젝트 생성",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.wavizGray[800],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.wavizGray[700]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 카테고리 선택
                          ProjectFormSection(
                            title: "카테고리",
                            isRequired: true,
                            icon: Icons.category_outlined,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _CategorySelector(
                                  projectType: projectType,
                                  projectState: projectState,
                                  hasError: projectType == null && _isCreating,
                                  onCategorySelected: (type) {
                                    setState(() {
                                      projectType = type;
                                    });
                                  },
                                ),
                                if (projectType == null && _isCreating) ...[
                                  const Gap(8),
                                  Text(
                                    "카테고리를 선택해주세요",
                                    style: TextStyle(
                                      color: Colors.red.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),

                          // 프로젝트 유형
                          ProjectFormSection(
                            title: "프로젝트 유형",
                            isRequired: true,
                            icon: Icons.settings_outlined,
                            child: ProjectTypeSelector(
                              selectedType: enumProjectClass,
                              onTypeChanged: (type) {
                                setState(() {
                                  enumProjectClass = type;
                                });
                              },
                            ),
                          ),

                          // 목표 금액
                          ProjectFormSection(
                            title: "목표 금액",
                            isRequired: true,
                            icon: Icons.payments_outlined,
                            description: "최소 50만 원 ~ 최대 1억 원 사이에서 설정해 주세요.",
                            child: PriceFormField(controller: priceTextEditingController),
                          ),

                          // 프로젝트 제목
                          ProjectFormSection(
                            title: "프로젝트 제목",
                            isRequired: true,
                            icon: Icons.title_outlined,
                            child: ProjectTitleFormField(controller: titleTextEditingController),
                          ),

                          // 프로젝트 메이커
                          ProjectFormSection(
                            title: "프로젝트 메이커",
                            isRequired: true,
                            icon: Icons.person_outline,
                            child: MakerNameFormField(controller: makerTextEditingController),
                          ),

                          // 대표 이미지
                          ProjectFormSection(
                            title: "대표 이미지",
                            isRequired: false,
                            icon: Icons.image_outlined,
                            description: "메인, 검색 결과, SNS 광고 등 여러 곳에서 노출할 대표 이미지를 등록해 주세요.",
                            child: ProjectImageSelector(
                              selectedImage: image,
                              onImagePicked: _pickImage,
                              onImageRemoved: () {
                                setState(() {
                                  image = null;
                                });
                              },
                            ),
                          ),

                          // 프로젝트 종료일
                          ProjectFormSection(
                            title: "프로젝트 종료일",
                            isRequired: true,
                            icon: Icons.calendar_today_outlined,
                            child: _DatePickerField(
                              controller: deadlineTextEditingController,
                              onDateSelected: _selectDate,
                            ),
                          ),

                          // 프로젝트 요약
                          ProjectFormSection(
                            title: "프로젝트 요약",
                            isRequired: true,
                            icon: Icons.description_outlined,
                            description: "소개 영상이나 사진과 함께 보이는 글이에요. 프로젝트를 쉽고 간결하게 소개해주세요.",
                            isLast: true,
                            child: ProjectDescriptionFormField(controller: descriptionTextEditingController),
                          ),
                        ],
                      ),
                    ),

                    // 에러 메시지
                    if (projectState.errorMessage != null) ...[
                      const Gap(16),
                      FormErrorMessage(message: projectState.errorMessage!),
                    ],

                    const Gap(24),
                  ],
                ),
              ),
            ),
          ),

          // 하단 고정 버튼 영역
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: AppColors.wavizGray[100]!, width: 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              16 + MediaQuery.of(context).padding.bottom,
            ),
            child: ProjectSaveButton(
              isLoading: _isCreating || projectState.isLoading,
              onPressed: _saveProject,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (pickedImage != null) {
        setState(() {
          image = pickedImage;
        });
      }
    } catch (e) {
      // 에러 처리
    }
  }

  Future<void> _selectDate() async {
    try {
      final date = await _showCustomDatePicker();

      if (date != null) {
        deadlineTextEditingController.text = DateFormat("yyyy-MM-dd").format(date);
      }
    } catch (e) {
      // 에러 처리
    }
  }

  Future<DateTime?> _showCustomDatePicker() async {
    DateTime selectedDate = DateTime.now().add(const Duration(days: 30));
    final DateTime minDate = DateTime.now();
    final DateTime maxDate = DateTime.now().add(const Duration(days: 365));

    return await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        return _DatePickerBottomSheet(
          selectedDate: selectedDate,
          minDate: minDate,
          maxDate: maxDate,
        );
      },
    );
  }

  Future<void> _saveProject() async {
    bool hasError = false;

    if (!_formKey.currentState!.validate()) {
      hasError = true;
    }

    if (projectType == null) {
      hasError = true;
    }

    if (hasError) {
      setState(() {
        _isCreating = true;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _isCreating = false;
          });
        }
      });
      return;
    }

    setState(() {
      _isCreating = true;
    });

    try {
      final loginState = ref.read(loginNotifierProvider);
      if (!loginState.isLogin || loginState.userid == null) {
        throw Exception('로그인이 필요합니다');
      }

      Uint8List? imageBytes;
      if (image != null) {
        imageBytes = await image!.readAsBytes();
      }

      final projectEntity = ProjectEntity(
        categoryId: 1,
        projectTypeId: projectType!.id,
        title: titleTextEditingController.text.trim(),
        owner: makerTextEditingController.text.trim(),
        deadline: deadlineTextEditingController.text.trim(),
        description: descriptionTextEditingController.text.trim(),
        price: int.parse(priceTextEditingController.text.replaceAll(',', '')),
        projectClass: enumProjectClass.title,
        userId: loginState.userid.toString(),
        projectImage: imageBytes ?? Uint8List(0),
      );

      final success = await ref
          .read(projectNotifierProvider.notifier)
          .createProject(projectEntity);

      if (mounted) {
        if (success) {
          WavizDialog.success(
            context: context,
            title: "프로젝트 생성 완료",
            message: "프로젝트가 성공적으로 생성되었습니다.\n마이페이지에서 확인할 수 있습니다.",
            confirmText: "마이페이지에서 확인하기",
            onConfirm: () {
              context.go("/my");
            },
          );
        }
      }
    } catch (e) {
      // 에러 발생 시 로딩 상태만 해제
    } finally {
      if (mounted) {
        setState(() {
          _isCreating = false;
        });
      }
    }
  }
}

/// 카테고리 선택 위젯
class _CategorySelector extends StatelessWidget {
  final ProjectType? projectType;
  final ProjectState projectState;
  final bool hasError;
  final ValueChanged<ProjectType> onCategorySelected;

  const _CategorySelector({
    required this.projectType,
    required this.projectState,
    required this.hasError,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showCategoryBottomSheet(context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: hasError ? Colors.red : AppColors.wavizGray[200]!,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.category, color: AppColors.wavizGray[400], size: 20),
              const Gap(12),
              Expanded(
                child: Text(
                  projectType?.type ?? "카테고리를 선택해주세요",
                  style: TextStyle(
                    color: projectType != null
                        ? AppColors.wavizGray[800]
                        : (hasError ? Colors.red : AppColors.wavizGray[500]),
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: AppColors.wavizGray[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        return _CategoryBottomSheet(
          projectState: projectState,
          selectedProjectType: projectType,
          onCategorySelected: onCategorySelected,
        );
      },
    );
  }
}

/// 카테고리 선택 바텀시트
class _CategoryBottomSheet extends StatelessWidget {
  final ProjectState projectState;
  final ProjectType? selectedProjectType;
  final ValueChanged<ProjectType> onCategorySelected;

  const _CategoryBottomSheet({
    required this.projectState,
    required this.selectedProjectType,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 핸들
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.wavizGray[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 헤더
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.wavizGray[100]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "카테고리 선택",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        "프로젝트에 맞는 카테고리를 선택해주세요",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.wavizGray[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.wavizGray[600],
                    size: 22,
                  ),
                ),
              ],
            ),
          ),

          // 현재 선택된 카테고리 표시
          if (selectedProjectType != null) ...[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 12, 20, 6),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Gap(6),
                  Text(
                    "현재 선택: ",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.wavizGray[600],
                    ),
                  ),
                  Text(
                    selectedProjectType!.type ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // 카테고리 리스트
          Expanded(
            child: projectState.projectTypes.isEmpty
                ? const LoadingWidget(message: '카테고리를 불러오는 중...')
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                    itemBuilder: (context, index) {
                      final data = projectState.projectTypes[index];
                      final isSelected = selectedProjectType?.id == data.id;

                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            onCategorySelected(data);
                            Future.delayed(
                              const Duration(milliseconds: 150),
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: _CategoryItem(
                            data: data,
                            isSelected: isSelected,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, _) => const Gap(10),
                    itemCount: projectState.projectTypes.length,
                  ),
          ),
        ],
      ),
    );
  }
}

/// 카테고리 아이템
class _CategoryItem extends StatelessWidget {
  final ProjectType data;
  final bool isSelected;

  const _CategoryItem({
    required this.data,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.wavizGray[200]!,
          width: isSelected ? 1.5 : 1,
        ),
        color: isSelected ? AppColors.secondary : Colors.white,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isSelected ? null : AppColors.bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              data.imagePath ?? "assets/icons/type/all.svg",
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : AppColors.wavizGray[600]!,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Text(
              data.type ?? "",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.wavizGray[800],
              ),
            ),
          ),
          if (isSelected)
            AnimatedScale(
              scale: 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            )
          else
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.wavizGray[300]!,
                  width: 1.5,
                ),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

/// 날짜 선택 필드
class _DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDateSelected;

  const _DatePickerField({
    required this.controller,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "종료일을 선택해주세요",
        prefixIcon: Icon(Icons.calendar_today, color: AppColors.wavizGray[400]),
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
        suffixIcon: IconButton(
          onPressed: onDateSelected,
          icon: Icon(Icons.date_range, color: AppColors.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      readOnly: true,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "프로젝트 종료일을 선택해주세요";
        }
        return null;
      },
    );
  }
}

/// 날짜 선택 바텀시트
class _DatePickerBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final DateTime minDate;
  final DateTime maxDate;

  const _DatePickerBottomSheet({
    required this.selectedDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  State<_DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<_DatePickerBottomSheet> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 핸들
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.wavizGray[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 헤더
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.wavizGray[100]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "프로젝트 종료일 선택",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        "최대 1년 이내의 날짜를 선택해주세요",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.wavizGray[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.wavizGray[600],
                    size: 22,
                  ),
                ),
              ],
            ),
          ),

          // 현재 선택된 날짜 표시
          Container(
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                  size: 20,
                ),
                const Gap(12),
                Text(
                  "선택된 날짜: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.wavizGray[600],
                  ),
                ),
                Text(
                  DateFormat("yyyy년 MM월 dd일").format(selectedDate),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          // 캘린더
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.primary.withValues(alpha: 0.2),
                  onPrimary: AppColors.primary,
                  surface: Colors.white,
                  onSurface: AppColors.wavizGray[800],
                  onSurfaceVariant: AppColors.wavizGray[500],
                ),
                textTheme: Theme.of(context).textTheme.copyWith(
                  headlineSmall: TextStyle(
                    color: AppColors.wavizGray[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  labelLarge: TextStyle(
                    color: AppColors.wavizGray[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  bodyLarge: TextStyle(
                    color: AppColors.wavizGray[800],
                    fontSize: 16,
                  ),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: widget.minDate,
                lastDate: widget.maxDate,
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          ),

          // 하단 버튼
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    text: "취소",
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Gap(12),
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    text: "선택 완료",
                    onPressed: () {
                      Navigator.pop(context, selectedDate);
                    },
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
