import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/domain/entity/shared/category.dart';

part 'fetch_home_categories.g.dart';

class FetchHomeCategoriesUseCase {
  Future<List<ProjectCategory>> call() async {
    return [
      ProjectCategory(
        id: 1,
        iconPath: "assets/icons/categories/1.png",
        title: "펀딩+",
      ),
      ProjectCategory(
        id: 5,
        iconPath: "assets/icons/categories/5.png",
        title: "혜택",
      ),
      ProjectCategory(
        id: 2,
        iconPath: "assets/icons/categories/2.png",
        title: "오픈예정",
      ),
      ProjectCategory(
        id: 6,
        iconPath: "assets/icons/categories/6.png",
        title: "펀딩체험단",
      ),
      ProjectCategory(
        id: 3,
        iconPath: "assets/icons/categories/3.png",
        title: "스토어",
      ),
      ProjectCategory(
        id: 7,
        iconPath: "assets/icons/categories/7.png",
        title: "뷰티워크",
      ),
      ProjectCategory(
        id: 4,
        iconPath: "assets/icons/categories/4.png",
        title: "예약구매",
      ),
      ProjectCategory(
        id: 8,
        iconPath: "assets/icons/categories/8.png",
        title: "새학기출발",
      ),
      ProjectCategory(
        id: 9,
        iconPath: "assets/icons/categories/9.png",
        title: "클래스수강",
      ),
    ];
  }
}

@riverpod
FetchHomeCategoriesUseCase fetchHomeCategoriesUseCase(Ref ref) {
  return FetchHomeCategoriesUseCase();
}
