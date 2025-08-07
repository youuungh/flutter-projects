import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetMyUseCase implements IUseCase<User, void> {
  GetMyUseCase(this._writeRepository);

  final IWriteRepository _writeRepository;

  @override
  Future<User> execute([void params]) {
    return _writeRepository.getMy();
  }
}