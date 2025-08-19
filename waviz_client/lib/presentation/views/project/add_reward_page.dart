import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/project/project_notifier.dart';

class AddRewardPage extends ConsumerStatefulWidget {
  final String projectId;

  const AddRewardPage({super.key, required this.projectId});

  @override
  ConsumerState<AddRewardPage> createState() => _AddRewardPageState();
}

class _AddRewardPageState extends ConsumerState<AddRewardPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<XFile> selectedImages = [];
  bool _isCreating = false;

  @override
  void dispose() {
    priceController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectState = ref.watch(projectNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "리워드 추가",
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
                          // 프로젝트 정보
                          ProjectFormSection(
                            title: "프로젝트 정보",
                            isRequired: false,
                            icon: Icons.info_outlined,
                            child: ProjectInfoWidget(projectId: widget.projectId),
                          ),

                          // 리워드 이미지
                          ProjectFormSection(
                            title: "리워드 이미지",
                            isRequired: false,
                            icon: Icons.image_outlined,
                            description: "리워드를 잘 보여줄 수 있는 이미지를 추가해주세요. (최대 5장)",
                            child: RewardImageSelector(
                              selectedImages: selectedImages,
                              onAddImages: _pickImages,
                              onRemoveImage: (index) {
                                setState(() {
                                  selectedImages.removeAt(index);
                                });
                              },
                            ),
                          ),

                          // 리워드 금액
                          ProjectFormSection(
                            title: "리워드 금액",
                            isRequired: true,
                            icon: Icons.payments_outlined,
                            description: "최소 1,000원 ~ 최대 1,000만원 사이에서 설정해 주세요.",
                            child: RewardPriceFormField(controller: priceController),
                          ),

                          // 리워드명
                          ProjectFormSection(
                            title: "리워드명",
                            isRequired: true,
                            icon: Icons.card_giftcard_outlined,
                            child: RewardTitleFormField(controller: titleController),
                          ),

                          // 리워드 설명
                          ProjectFormSection(
                            title: "리워드 설명",
                            isRequired: true,
                            icon: Icons.description_outlined,
                            description: "리워드 구성과 혜택을 자세히 설명해주세요.",
                            child: RewardDescriptionFormField(controller: descriptionController),
                          ),

                          // 미리보기
                          if (_shouldShowPreview()) ...[
                            ProjectFormSection(
                              title: "리워드 미리보기",
                              isRequired: false,
                              icon: Icons.preview_outlined,
                              description: "입력한 정보로 생성될 리워드 카드입니다.",
                              isLast: true,
                              child: RewardPreviewCard(
                                title: titleController.text.isNotEmpty
                                    ? titleController.text
                                    : "리워드명",
                                price: _getParsedPrice(),
                                description: descriptionController.text.isNotEmpty
                                    ? descriptionController.text
                                    : "리워드 설명",
                                images: selectedImages.isNotEmpty ? selectedImages : null,
                              ),
                            ),
                          ] else ...[
                            const SizedBox(height: 16),
                          ],
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
            child: RewardActionButtons(
              isLoading: _isCreating || projectState.isLoading,
              onCancel: () => context.pop(),
              onSave: _saveReward,
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowPreview() {
    return titleController.text.isNotEmpty || 
           priceController.text.isNotEmpty ||
           descriptionController.text.isNotEmpty ||
           selectedImages.isNotEmpty;
  }

  int _getParsedPrice() {
    if (priceController.text.isEmpty) return 0;
    try {
      return int.parse(priceController.text.replaceAll(',', ''));
    } catch (e) {
      return 0;
    }
  }

  Future<void> _pickImages() async {
    try {
      if (selectedImages.length >= 5) {
        return;
      }

      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (images.isNotEmpty) {
        final remainingSlots = 5 - selectedImages.length;
        final imagesToAdd = images.take(remainingSlots).toList();

        setState(() {
          selectedImages.addAll(imagesToAdd);
        });
      }
    } catch (e) {
      // 에러 처리
    }
  }

  Future<void> _saveReward() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isCreating = true;
    });

    try {
      List<int> imageBytes = [];
      if (selectedImages.isNotEmpty) {
        for (final image in selectedImages) {
          final bytes = await image.readAsBytes();
          imageBytes.addAll(bytes);
        }
      }

      final rewardEntity = RewardEntity(
        projectId: int.tryParse(widget.projectId),
        title: titleController.text.trim(),
        price: int.parse(priceController.text.replaceAll(',', '')),
        description: descriptionController.text.trim(),
        imageRaw: imageBytes,
        imageUrl: "", // 서버에서 생성될 URL
      );

      final success = await ref
          .read(projectNotifierProvider.notifier)
          .createProjectReward(widget.projectId, rewardEntity);

      if (mounted) {
        if (success) {
          WavizDialog.success(
            context: context,
            title: "리워드 추가 완료",
            message: "리워드가 성공적으로 추가되었습니다.\n마이페이지에서 확인할 수 있습니다.",
            confirmText: "마이페이지에서 확인하기",
            onConfirm: () {
              context.go("/my");
            },
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreating = false;
        });
      }
    }
  }
}
