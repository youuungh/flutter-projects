import 'dart:math';

import 'package:core_bloc/bloc.dart';
import 'package:search_domain/domain.dart';

class SearchQueryCubit extends IFlowCubit<String> {
  SearchQueryCubit() : super(const DataState(data: ''));

  void search(String query) {
    emitData(query);
  }
}

class SearchRecentChannelListCubit extends IFlowCubit<List<Channel>> {
  SearchRecentChannelListCubit(
    this._setRecentSearchChannelsUseCase,
    this._getRecentSearchChannelsUseCase,
  );

  final SetRecentSearchChannelsUseCase _setRecentSearchChannelsUseCase;
  final GetRecentSearchChannelsUseCase _getRecentSearchChannelsUseCase;

  Future<void> load() async {
    emitLoading();

    try {
      final List<Channel> value = await _getRecentSearchChannelsUseCase
          .execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> add(Channel channel) async {
    try {
      final List<Channel> value = [...state.data ?? []];
      final int findIndex = value.indexWhere((e) => e.id == channel.id);
      if (findIndex != -1) {
        value.removeAt(findIndex);
      }
      value.insert(0, channel);
      final SetRecentSearchChannelsParams params =
          SetRecentSearchChannelsParams(
            channelList: value,
          );
      await _setRecentSearchChannelsUseCase.execute(params);
      emitData(value.sublist(0, min(3, value.length)));
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> delete(Channel channel) async {
    try {
      final List<Channel> value = [...state.data ?? []]
        ..removeWhere((e) => e.id == channel.id);
      final SetRecentSearchChannelsParams params =
          SetRecentSearchChannelsParams(
            channelList: value,
          );
      await _setRecentSearchChannelsUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class SearchPopularChannelListCubit extends IFlowCubit<List<Channel>> {
  SearchPopularChannelListCubit(this._getPopularChannelsForSearchUseCase);

  final GetPopularChannelsForSearchUseCase _getPopularChannelsForSearchUseCase;

  Future<void> load() async {
    emitLoading();

    try {
      final List<Channel> value = await _getPopularChannelsForSearchUseCase
          .execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class SearchPostListCubit extends IFlowCubit<List<Post>> {
  SearchPostListCubit(this._getSearchPostsUseCase);

  final GetSearchPostsUseCase _getSearchPostsUseCase;

  Future<void> load({
    required String query,
  }) async {
    emitLoading();

    try {
      final GetSearchPostsParams params = GetSearchPostsParams(
        query: query,
      );
      final List<Post> value = await _getSearchPostsUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
