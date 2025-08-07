import 'package:data/data.dart';

class FirebaseDataSource {
  FirebaseDataSource(this._firebaseRemoteDataSource);

  final IFirebaseRemoteDataSource _firebaseRemoteDataSource;

  Future<String> getAdImage() {
    return _firebaseRemoteDataSource.getString('ad_image');
  }
}
