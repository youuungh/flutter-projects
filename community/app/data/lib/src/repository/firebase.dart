import 'package:data/data.dart';
import 'package:domain/domain.dart';

class FirebaseRepository implements IFirebaseRepository {
  FirebaseRepository(this._firebaseDataSource);

  final FirebaseDataSource _firebaseDataSource;

  @override
  Future<String> getAdImage() {
    return _firebaseDataSource.getAdImage();
  }
}
