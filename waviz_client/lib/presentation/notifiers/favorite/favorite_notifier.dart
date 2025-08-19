import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/use_cases/favorite/favorite_use_cases.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

part 'favorite_notifier.freezed.dart';
part 'favorite_notifier.g.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  factory FavoriteState({
    @Default([]) List<CategoryEntity> favoriteProjects,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _FavoriteState;
}

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier {
  late LoadFavoriteProjectsUseCase _loadFavoriteProjectsUseCase;
  late AddFavoriteProjectUseCase _addFavoriteProjectUseCase;
  late RemoveFavoriteProjectUseCase _removeFavoriteProjectUseCase;

  @override
  FavoriteState build() {
    _loadFavoriteProjectsUseCase = ref.watch(loadFavoriteProjectsUseCaseProvider);
    _addFavoriteProjectUseCase = ref.watch(addFavoriteProjectUseCaseProvider);
    _removeFavoriteProjectUseCase = ref.watch(removeFavoriteProjectUseCaseProvider);

    // 로그인 상태 감시
    final loginState = ref.watch(loginNotifierProvider);
    
    // 로그인 상태 변화 감지
    ref.listen(loginNotifierProvider, (previous, current) {
      if (previous?.isLogin != current.isLogin) {
        if (current.isLogin) {
          // 로그인되었을 때 즐겨찾기 데이터 로드
          Future.microtask(() => _loadFavoriteProjects());
        } else {
          // 로그아웃되었을 때 즐겨찾기 데이터 초기화
          Future.microtask(() => _clearFavoriteProjects());
        }
      }
    });

    // 초기 로딩: 로그인된 상태에서만 데이터 로드
    if (loginState.isLogin) {
      Future.microtask(() => _loadFavoriteProjects());
    }

    return FavoriteState();
  }

  void _loadFavoriteProjects() {
    try {
      final projects = _loadFavoriteProjectsUseCase.call();
      state = state.copyWith(favoriteProjects: projects, errorMessage: null);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }

  void _clearFavoriteProjects() {
    // 로그아웃 시 즐겨찾기 데이터 초기화
    state = state.copyWith(
      favoriteProjects: [],
      isLoading: false,
      errorMessage: null,
    );
  }

  Future<void> addItem(CategoryEntity project) async {
    final loginState = ref.read(loginNotifierProvider);
    if (!loginState.isLogin) {
      state = state.copyWith(
        errorMessage: '로그인이 필요한 서비스입니다.',
      );
      return;
    }

    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final success = await _addFavoriteProjectUseCase.call(
        project,
        state.favoriteProjects,
      );
      
      if (success) {
        state = state.copyWith(
          favoriteProjects: [...state.favoriteProjects, project],
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to add favorite project',
        );
      }
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> removeItem(CategoryEntity project) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final success = await _removeFavoriteProjectUseCase.call(
        project,
        state.favoriteProjects,
      );
      
      if (success) {
        final updatedProjects = state.favoriteProjects
            .where((element) => element.id != project.id)
            .toList();
        
        state = state.copyWith(
          favoriteProjects: updatedProjects,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to remove favorite project',
        );
      }
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  bool isFavorite(CategoryEntity project) {
    return state.favoriteProjects.any((element) => element.id == project.id);
  }

  Future<void> refresh() async {
    final loginState = ref.read(loginNotifierProvider);
    if (loginState.isLogin) {
      _loadFavoriteProjects();
    } else {
      _clearFavoriteProjects();
    }
  }
}
