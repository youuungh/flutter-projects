import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class CreatePostUseCase implements IUseCase<Post, CreatePostParams> {

  CreatePostUseCase(this._writeRepository);
  final IWriteRepository _writeRepository;

  @override
  Future<Post> execute([CreatePostParams? params]) {
    final CreatePostParams input = params ?? CreatePostParams();
    return _writeRepository.createPost(
      channel: input.channel,
      title: input.title,
      content: input.content,
    );
  }
}

class CreatePostParams {

  CreatePostParams({
    this.channel = '',
    this.title = '',
    this.content = '',
  });
  final String channel;
  final String title;
  final String content;
}
