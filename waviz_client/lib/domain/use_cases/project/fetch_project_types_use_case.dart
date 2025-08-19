import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/project_type.dart';

part 'fetch_project_types_use_case.g.dart';

class FetchProjectTypesUseCase {
  Future<List<ProjectType>> call() async {
    await Future.delayed(const Duration(milliseconds: 350));
    return [
      const ProjectType(
        id: 1,
        type: "테크·가전",
        imagePath: "assets/icons/type/1.svg",
      ),
      const ProjectType(id: 2, type: "패션", imagePath: "assets/icons/type/2.svg"),
      const ProjectType(id: 3, type: "뷰티", imagePath: "assets/icons/type/3.svg"),
      const ProjectType(
        id: 4,
        type: "홈·리빙",
        imagePath: "assets/icons/type/4.svg",
      ),
      const ProjectType(
        id: 5,
        type: "스포츠·아웃도어",
        imagePath: "assets/icons/type/5.svg",
      ),
      const ProjectType(id: 6, type: "푸드", imagePath: "assets/icons/type/6.svg"),
      const ProjectType(
        id: 7,
        type: "도서·전자책",
        imagePath: "assets/icons/type/7.svg",
      ),
      const ProjectType(id: 8, type: "클래스", imagePath: "assets/icons/type/8.svg"),
    ];
  }
}

@riverpod
FetchProjectTypesUseCase fetchProjectTypesUseCase(Ref ref) {
  return FetchProjectTypesUseCase();
}
