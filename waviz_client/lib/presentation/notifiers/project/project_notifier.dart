import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';
import 'package:waviz_client/domain/use_cases/project/fetch_project_types_use_case.dart';
import 'package:waviz_client/domain/use_cases/project/project_use_cases.dart';

part 'project_notifier.freezed.dart';
part 'project_notifier.g.dart';

@freezed
abstract class ProjectState with _$ProjectState {
  factory ProjectState({
    ProjectEntity? currentProject,
    @Default([]) List<ProjectType> projectTypes,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ProjectState;
}

@riverpod
class ProjectDetailNotifier extends _$ProjectDetailNotifier {
  late FetchProjectByIdUseCase _fetchProjectByIdUseCase;

  @override
  Future<ProjectEntity?> build(String id) async {
    _fetchProjectByIdUseCase = ref.watch(fetchProjectByIdUseCaseProvider);
    
    try {
      final projects = await _fetchProjectByIdUseCase.call(id);
      return projects.isNotEmpty ? projects.first : null;
    } catch (error) {
      rethrow;
    }
  }
}

@riverpod
class ProjectNotifier extends _$ProjectNotifier {
  late CreateProjectUseCase _createProjectUseCase;
  late CreateProjectRewardUseCase _createProjectRewardUseCase;
  late UpdateProjectOpenStateUseCase _updateProjectOpenStateUseCase;
  late DeleteProjectUseCase _deleteProjectUseCase;
  late FetchProjectTypesUseCase _fetchProjectTypesUseCase;

  @override
  ProjectState build() {
    _createProjectUseCase = ref.watch(createProjectUseCaseProvider);
    _createProjectRewardUseCase = ref.watch(createProjectRewardUseCaseProvider);
    _updateProjectOpenStateUseCase = ref.watch(updateProjectOpenStateUseCaseProvider);
    _deleteProjectUseCase = ref.watch(deleteProjectUseCaseProvider);
    _fetchProjectTypesUseCase = ref.watch(fetchProjectTypesUseCaseProvider);

    // build 완료 후 비동기적으로 데이터 로딩 시작
    Future.microtask(() => _loadProjectTypes());

    return ProjectState();
  }

  Future<void> _loadProjectTypes() async {
    try {
      final projectTypes = await _fetchProjectTypesUseCase.call();
      state = state.copyWith(projectTypes: projectTypes);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }

  Future<bool> createProject(ProjectEntity projectEntity) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final result = await _createProjectUseCase.call(projectEntity);
      
      if (result) {
        state = state.copyWith(
          currentProject: projectEntity,
          isLoading: false,
        );
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

  Future<bool> createProjectReward(String projectId, RewardEntity rewardEntity) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final result = await _createProjectRewardUseCase.call(projectId, rewardEntity);
      
      state = state.copyWith(isLoading: false);
      return result;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<bool> updateProjectOpenState(String projectId, ProjectEntity projectEntity) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final result = await _updateProjectOpenStateUseCase.call(projectId, projectEntity);
      
      if (result) {
        state = state.copyWith(
          currentProject: projectEntity,
          isLoading: false,
        );
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
      
      final result = await _deleteProjectUseCase.call(projectId);
      
      if (result) {
        state = state.copyWith(
          currentProject: null,
          isLoading: false,
        );
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

  void updateProjectId(int id) {
    if (state.currentProject != null) {
      state = state.copyWith(
        currentProject: state.currentProject!.copyWith(id: id),
      );
    }
  }
}
