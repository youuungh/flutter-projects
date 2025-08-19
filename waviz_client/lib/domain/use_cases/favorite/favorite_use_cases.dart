import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/enum/enum_shared_pref_key.dart';
import 'package:waviz_client/data/repository/favorite/favorite_repository_impl.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/repository/favorite/favorite_repository.dart';

part 'favorite_use_cases.g.dart';

class LoadFavoriteProjectsUseCase {
  final FavoriteRepository _repository;

  LoadFavoriteProjectsUseCase(this._repository);

  List<CategoryEntity> call() {
    try {
      final value = _repository.readValue(EnumSharedPreferencesKey.favoriteProjects.value);
      
      if (value?.isEmpty ?? true) {
        return [];
      }
      
      final jsonData = jsonDecode(value!);
      final projects = jsonData['projects'] as List<dynamic>?;
      
      if (projects == null) return [];
      
      return projects
          .map((project) => CategoryEntity.fromJson(project as Map<String, dynamic>))
          .toList();
    } catch (error) {
      return [];
    }
  }
}

class AddFavoriteProjectUseCase {
  final FavoriteRepository _repository;

  AddFavoriteProjectUseCase(this._repository);

  Future<bool> call(CategoryEntity project, List<CategoryEntity> currentProjects) async {
    try {
      final updatedProjects = [...currentProjects, project];
      final jsonData = {
        'projects': updatedProjects.map((p) => p.toJson()).toList(),
      };
      
      return await _repository.saveValue(
        EnumSharedPreferencesKey.favoriteProjects.value,
        jsonEncode(jsonData),
      );
    } catch (error) {
      return false;
    }
  }
}

class RemoveFavoriteProjectUseCase {
  final FavoriteRepository _repository;

  RemoveFavoriteProjectUseCase(this._repository);

  Future<bool> call(CategoryEntity project, List<CategoryEntity> currentProjects) async {
    try {
      final updatedProjects = currentProjects
          .where((element) => element.id != project.id)
          .toList();
      
      final jsonData = {
        'projects': updatedProjects.map((p) => p.toJson()).toList(),
      };
      
      return await _repository.saveValue(
        EnumSharedPreferencesKey.favoriteProjects.value,
        jsonEncode(jsonData),
      );
    } catch (error) {
      return false;
    }
  }
}

@riverpod
LoadFavoriteProjectsUseCase loadFavoriteProjectsUseCase(Ref ref) {
  final repository = ref.watch(favoriteRepositoryProvider);
  return LoadFavoriteProjectsUseCase(repository);
}

@riverpod
AddFavoriteProjectUseCase addFavoriteProjectUseCase(Ref ref) {
  final repository = ref.watch(favoriteRepositoryProvider);
  return AddFavoriteProjectUseCase(repository);
}

@riverpod
RemoveFavoriteProjectUseCase removeFavoriteProjectUseCase(Ref ref) {
  final repository = ref.watch(favoriteRepositoryProvider);
  return RemoveFavoriteProjectUseCase(repository);
}
