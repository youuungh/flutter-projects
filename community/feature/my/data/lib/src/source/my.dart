import 'package:my_data/data.dart';

class MyDataSource {
  MyDataSource(this._profileRemoteDataSource);

  final IProfileRemoteDataSource _profileRemoteDataSource;

  Future<dynamic> getMy() {
    return _profileRemoteDataSource.getMy();
  }
}
