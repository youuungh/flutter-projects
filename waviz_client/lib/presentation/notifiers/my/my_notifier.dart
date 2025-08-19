import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/use_cases/my/my_use_cases.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

part 'my_notifier.freezed.dart';
part 'my_notifier.g.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  factory MyPageState({
    bool? loginState,
    LoginEntity? loginEntity,
    @Default([]) List<ProjectEntity> userProjects,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _MyPageState;
}

@riverpod
class MyPageNotifier extends _$MyPageNotifier {
  late FetchUserProjectsUseCase _fetchUserProjectsUseCase;
  late UpdateUserProjectUseCase _updateUserProjectUseCase;
  late DeleteUserProjectUseCase _deleteUserProjectUseCase;

  @override
  MyPageState build() {
    _fetchUserProjectsUseCase = ref.watch(fetchUserProjectsUseCaseProvider);
    _updateUserProjectUseCase = ref.watch(updateUserProjectUseCaseProvider);
    _deleteUserProjectUseCase = ref.watch(deleteUserProjectUseCaseProvider);

    final loginStatus = ref.watch(loginNotifierProvider);
    
    final loginEntity = loginStatus.isLogin ? LoginEntity(
      id: loginStatus.userid,
      email: loginStatus.email ?? '',
      password: '',
      username: loginStatus.username,
    ) : null;

    // 로그인 상태가 변경되었을 때 자동으로 프로젝트 불러오기
    ref.listen(loginNotifierProvider, (previous, current) {
      if (previous?.isLogin != current.isLogin) {
        if (current.isLogin && current.userid != null) {
          // 로그인되었을 때 프로젝트 불러오기
          Future.microtask(() => fetchUserProjects());
        } else if (!current.isLogin) {
          // 로그아웃되었을 때 프로젝트 초기화
          Future.microtask(() => clearProjects());
        }
      }
    });

    // 초기 상태에서 로그인되어 있다면 프로젝트 불러오기
    if (loginStatus.isLogin && loginStatus.userid != null) {
      Future.microtask(() {
        // 이미 프로젝트가 로드되어 있지 않고, 로딩 중도 아닐 때만 불러오기
        if (state.userProjects.isEmpty && !state.isLoading) {
          fetchUserProjects();
        }
      });
    }

    return MyPageState(
      loginState: loginStatus.isLogin,
      loginEntity: loginEntity,
    );
  }

  Future<void> fetchUserProjects() async {
    if (!state.loginState! || state.loginEntity?.id == null) return;

    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final projects = await _fetchUserProjectsUseCase.call(
        state.loginEntity!.id.toString(),
      );
      
      state = state.copyWith(
        userProjects: projects,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<bool> updateProject(String projectId, ProjectEntity projectEntity) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final result = await _updateUserProjectUseCase.call(projectId, projectEntity);

      if (result) {
        await fetchUserProjects();
      } else {
        state = state.copyWith(isLoading: false);
      }

      return result;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<bool> deleteProject(String projectId) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final result = await _deleteUserProjectUseCase.call(projectId);
      
      if (result) {
        await fetchUserProjects();
      } else {
        state = state.copyWith(isLoading: false);
      }
      
      return result;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<void> refresh() async {
    await fetchUserProjects();
  }

  void clearProjects() {
    state = state.copyWith(
      userProjects: [],
      isLoading: false,
      errorMessage: null,
    );
  }
}
