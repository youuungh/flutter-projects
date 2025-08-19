import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/data_sources/remote/home/home_api.dart';
import 'package:waviz_client/data/data_sources/remote/home/home_api_service.dart';
import 'package:waviz_client/data/mapper/home/home_mapper.dart';
import 'package:waviz_client/domain/entity/home/home_entity.dart';
import 'package:waviz_client/domain/repository/home/home_repository.dart';

part 'home_repository_impl.g.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi homeApiService;

  HomeRepositoryImpl(this.homeApiService);

  @override
  Future<List<HomeEntity>> getHomeProjects() async {
    final result = await homeApiService.getHomeProjects();
    return HomeMapper.toEntityList(result.projects);
  }
}

@riverpod
HomeRepository homeRepository(Ref ref) {
  final service = ref.watch(homeApiServiceProvider);
  return HomeRepositoryImpl(service);
}
