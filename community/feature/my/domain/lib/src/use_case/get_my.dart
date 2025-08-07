import 'package:core_util/util.dart';
import 'package:my_domain/domain.dart';

class GetMyPageUseCase implements IUseCase<User, void> {
  GetMyPageUseCase(this._myRepository);

  final IMyRepository _myRepository;

  @override
  Future<User> execute([void params]) {
    return _myRepository.getMy();
  }
}
