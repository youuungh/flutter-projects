import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';

class WriteRepository implements IWriteRepository {
  WriteRepository(this._writeDataSource);

  final WriteDataSource _writeDataSource;

  @override
  Future<Post> createPost({
    required String channel,
    required String title,
    required String content,
  }) async {
    final dynamic json = await _writeDataSource.createPost(
      channel: channel,
      title: title,
      content: content,
    );
    return Post.fromJson(json as Map<String, dynamic>);
  }

  @override
  Future<User> getMy() async {
    final dynamic json = await _writeDataSource.getMy();
    return User.fromJson(json as Map<String, dynamic>);
  }
}
