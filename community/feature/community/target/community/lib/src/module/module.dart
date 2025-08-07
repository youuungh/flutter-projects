import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';
import 'package:core_util/util.dart';
import 'package:feature_community/community.dart';
import 'package:tool_community_network/network.dart';

class CommunityDetailModule extends Module {
  @override
  void binds(Injector i) {
    /// Remote Data Source
    i.addLazySingleton<IPostRemoteDataSource>(
      () => PostRemoteDataSource(PostApi(Modular.get<CommunityRestClient>())),
      key: '$CommunityDetailModule$IPostRemoteDataSource',
    );
    i.addLazySingleton<IProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(
        ProfileApi(Modular.get<CommunityRestClient>()),
      ),
      key: '$CommunityDetailModule$IProfileRemoteDataSource',
    );

    /// Data Source
    i.addLazySingleton<CommunityDataSource>(
      () => CommunityDataSource(
        i.get<IPostRemoteDataSource>(
          key: '$CommunityDetailModule$IPostRemoteDataSource',
        ),
      ),
      key: '$CommunityDetailModule$CommunityDataSource',
    );
    i.addLazySingleton<PostDataSource>(
      () => PostDataSource(
        i.get<IPostRemoteDataSource>(
          key: '$CommunityDetailModule$IPostRemoteDataSource',
        ),
      ),
      key: '$CommunityDetailModule$PostDataSource',
    );
    i.addLazySingleton<WriteDataSource>(
      () => WriteDataSource(
        i.get<IPostRemoteDataSource>(
          key: '$CommunityDetailModule$IPostRemoteDataSource',
        ),
        i.get<IProfileRemoteDataSource>(
          key: '$CommunityDetailModule$IProfileRemoteDataSource',
        ),
      ),
      key: '$CommunityDetailModule$WriteDataSource',
    );

    /// Repository
    i.addLazySingleton<ICommunityRepository>(
      () => CommunityRepository(
        i.get<CommunityDataSource>(
          key: '$CommunityDetailModule$CommunityDataSource',
        ),
      ),
      key: '$CommunityDetailModule$ICommunityRepository',
    );
    i.addLazySingleton<IPostRepository>(
      () => PostRepository(
        i.get<PostDataSource>(key: '$CommunityDetailModule$PostDataSource'),
      ),
      key: '$CommunityDetailModule$IPostRepository',
    );
    i.addLazySingleton<IWriteRepository>(
      () => WriteRepository(
        i.get<WriteDataSource>(key: '$CommunityDetailModule$WriteDataSource'),
      ),
      key: '$CommunityDetailModule$IWriteRepository',
    );

    /// Use Case
    i.addLazySingleton<GetChannelsUseCase>(
      () => GetChannelsUseCase(
        i.get<ICommunityRepository>(
          key: '$CommunityDetailModule$ICommunityRepository',
        ),
      ),
      key: '$CommunityDetailModule$GetChannelsUseCase',
    );
    i.addLazySingleton<GetPopularChannelsUseCase>(
      () => GetPopularChannelsUseCase(
        i.get<ICommunityRepository>(
          key: '$CommunityDetailModule$ICommunityRepository',
        ),
      ),
      key: '$CommunityDetailModule$GetPopularChannelsUseCase',
    );
    i.addLazySingleton<GetPostsUseCase>(
      () => GetPostsUseCase(
        i.get<ICommunityRepository>(
          key: '$CommunityDetailModule$ICommunityRepository',
        ),
      ),
      key: '$CommunityDetailModule$GetPostsUseCase',
    );
    i.addLazySingleton<GetPostUseCase>(
      () => GetPostUseCase(
        i.get<IPostRepository>(key: '$CommunityDetailModule$IPostRepository'),
      ),
      key: '$CommunityDetailModule$GetPostUseCase',
    );
    i.addLazySingleton<GetCommentsUseCase>(
      () => GetCommentsUseCase(
        i.get<IPostRepository>(key: '$CommunityDetailModule$IPostRepository'),
      ),
      key: '$CommunityDetailModule$GetCommentsUseCase',
    );
    i.addLazySingleton<CreatePostUseCase>(
      () => CreatePostUseCase(
        i.get<IWriteRepository>(key: '$CommunityDetailModule$IWriteRepository'),
      ),
      key: '$CommunityDetailModule$CreatePostUseCase',
    );
    i.addLazySingleton<GetMyUseCase>(
      () => GetMyUseCase(
        i.get<IWriteRepository>(key: '$CommunityDetailModule$IWriteRepository'),
      ),
      key: '$CommunityDetailModule$GetMyUseCase',
    );
  }

  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in ICommunityDetailRoutes.routes) {
      r.add(route);
    }
  }
}
