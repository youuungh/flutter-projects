import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waviz_client/data/data_sources/local/shared_pref_provider.dart';
import 'package:waviz_client/domain/repository/favorite/favorite_repository.dart';

part 'favorite_repository_impl.g.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final SharedPreferences pref;

  FavoriteRepositoryImpl(this.pref);

  @override
  Future<bool> saveValue(String key, String value) async {
    final result = await pref.setString(key, value);
    return result;
  }

  @override
  String? readValue(String key) {
    final result = pref.getString(key);
    return result;
  }
}

@riverpod
FavoriteRepository favoriteRepository(Ref ref) {
  final pref = ref.watch(sharedPreferencesProvider);
  return FavoriteRepositoryImpl(pref);
}
