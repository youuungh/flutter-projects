import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/use_cases/category/fetch_category_projects.dart';
import 'package:waviz_client/domain/use_cases/category/fetch_project_types.dart';

part 'category_notifier.freezed.dart';
part 'category_notifier.g.dart';

enum EnumCategoryProjectType {
  recommend("추천순"),
  lowFunded("낮은 펀딩금액순"),
  highFunded("높은 펀딩금액순");

  final String value;

  const EnumCategoryProjectType(this.value);
}

@freezed
abstract class CategoryScreenState with _$CategoryScreenState {
  factory CategoryScreenState({
    ProjectType? selectedType,
    @Default(EnumCategoryProjectType.recommend) EnumCategoryProjectType? projectFilter,
    @Default([]) List<CategoryEntity> projects,
    @Default([]) List<ProjectType> projectTypes,
    @Default(AsyncValue.loading()) AsyncValue<List<CategoryEntity>> projectState,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CategoryScreenState;
}

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  late FetchCategoryProjectsUseCase _fetchCategoryProjectsUseCase;
  late FetchCategoryProjectsByTypeUseCase _fetchCategoryProjectsByTypeUseCase;
  late FetchProjectTypesUseCase _fetchProjectTypesUseCase;

  @override
  CategoryScreenState build() {
    _fetchCategoryProjectsUseCase = ref.watch(fetchCategoryProjectsUseCaseProvider);
    _fetchCategoryProjectsByTypeUseCase = ref.watch(fetchCategoryProjectsByTypeUseCaseProvider);
    _fetchProjectTypesUseCase = ref.watch(fetchProjectTypesUseCaseProvider);

    // build 완료 후 비동기적으로 데이터 로딩 시작
    Future.microtask(() => _loadProjectTypes());

    return CategoryScreenState(
      selectedType: const ProjectType(id: 0, type: "전체"),
      projectFilter: EnumCategoryProjectType.recommend,
      projects: [],
    );
  }

  Future<void> _loadProjectTypes() async {
    try {
      final projectTypes = await _fetchProjectTypesUseCase.call();
      state = state.copyWith(projectTypes: projectTypes);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }

  void updateType(ProjectType type) {
    state = state.copyWith(
      selectedType: type,
      projectFilter: EnumCategoryProjectType.recommend,
    );
  }

  void updateProjectFilter(EnumCategoryProjectType filter) {
    state = state.copyWith(
      projectState: const AsyncValue.loading(),
      projectFilter: filter,
    );

    final projects = [...state.projects];

    if (filter == EnumCategoryProjectType.lowFunded) {
      projects.sort((a, b) {
        if ((a.totalFunded ?? 0) > (b.totalFunded ?? 0)) {
          return 1;
        } else {
          return -1;
        }
      });
    } else if (filter == EnumCategoryProjectType.highFunded) {
      projects.sort((a, b) {
        if ((a.totalFunded ?? 0) > (b.totalFunded ?? 0)) {
          return -1;
        } else {
          return 1;
        }
      });
    }

    state = state.copyWith(
      projectState: AsyncValue.data(projects),
      projectFilter: filter,
    );
  }

  Future<void> fetchProjects(String categoryId) async {
    try {
      state = state.copyWith(
        projectState: const AsyncValue.loading(),
        isLoading: true,
        errorMessage: null,
      );

      String typeId = "${state.selectedType?.id}";
      if (state.selectedType?.id == 0) {
        if (state.selectedType?.type == "전체") {
          typeId = "all";
        } else {
          typeId = "best";
        }
      }

      List<CategoryEntity> projects;
      if (typeId == "all") {
        projects = await _fetchCategoryProjectsUseCase.call(categoryId);
      } else {
        projects = await _fetchCategoryProjectsByTypeUseCase.call(categoryId, typeId);
      }

      state = state.copyWith(
        projectState: AsyncValue.data(projects),
        projects: projects,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        projectState: AsyncValue.error(error, StackTrace.current),
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> refresh(String categoryId) async {
    await fetchProjects(categoryId);
  }
}
