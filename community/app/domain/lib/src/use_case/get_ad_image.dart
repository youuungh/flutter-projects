import 'package:core_util/util.dart';
import 'package:domain/domain.dart';

class GetAdImageUseCase implements IUseCase<String, void> {
  GetAdImageUseCase(this._firebaseRepository);

  final IFirebaseRepository _firebaseRepository;

  @override
  Future<String> execute([void params]) {
    return _firebaseRepository.getAdImage();
  }
}
