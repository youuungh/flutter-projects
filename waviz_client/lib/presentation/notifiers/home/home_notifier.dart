import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/domain/entity/home/home_entity.dart';
import 'package:waviz_client/domain/entity/shared/category.dart';
import 'package:waviz_client/domain/use_cases/home/fetch_home_categories.dart';
import 'package:waviz_client/domain/use_cases/home/fetch_home_projects.dart';

part 'home_notifier.freezed.dart';

part 'home_notifier.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<HomeEntity> projects,
    @Default([]) List<ProjectCategory> categories,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HomeState;
}

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  late FetchHomeProjectsUseCase _fetchHomeProjectsUseCase;
  late FetchHomeCategoriesUseCase _fetchHomeCategoriesUseCase;

  @override
  HomeState build() {
    // Provider가 dispose되지 않도록 유지
    ref.keepAlive();
    
    _fetchHomeProjectsUseCase = ref.watch(fetchHomeProjectsUseCaseProvider);
    _fetchHomeCategoriesUseCase = ref.watch(fetchHomeCategoriesUseCaseProvider);

    // 데이터가 없을 때만 로딩 시작
    Future.microtask(() {
      if (state.projects.isEmpty && state.categories.isEmpty && !state.isLoading) {
        _loadInitialData();
      }
    });
    
    return HomeState();
  }

  Future<void> _loadInitialData() async {
    await Future.wait([
      fetchHomeProjects(),
      fetchHomeCategories(),
    ]);
  }

  Future<void> fetchHomeProjects() async {
    // 이미 프로젝트 데이터가 있으면 스킵
    if (state.projects.isNotEmpty) return;
    
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final projects = await _fetchHomeProjectsUseCase.call();
      
      state = state.copyWith(
        projects: projects,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> fetchHomeCategories() async {
    // 이미 카테고리 데이터가 있으면 스킵
    if (state.categories.isNotEmpty) return;
    
    try {
      final categories = await _fetchHomeCategoriesUseCase.call();
      
      state = state.copyWith(categories: categories);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }

  Future<void> refresh() async {
    await _forceLoadData();
  }
  
  Future<void> _forceLoadData() async {
    await Future.wait([
      _forceRefreshProjects(),
      _forceRefreshCategories(),
    ]);
  }

  Future<void> _forceRefreshProjects() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final projects = await _fetchHomeProjectsUseCase.call();
      
      state = state.copyWith(
        projects: projects,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> _forceRefreshCategories() async {
    try {
      final categories = await _fetchHomeCategoriesUseCase.call();
      
      state = state.copyWith(categories: categories);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }
}
