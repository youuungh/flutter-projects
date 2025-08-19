abstract class FavoriteRepository {
  Future<bool> saveValue(String key, String value);
  String? readValue(String key);
}
