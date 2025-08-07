import 'package:my_data/data.dart';
import 'package:my_domain/domain.dart';

class MyRepository implements IMyRepository {

  MyRepository(this._myDataSource);
  final MyDataSource _myDataSource;

  @override
  Future<User> getMy() async {
    final dynamic json = await _myDataSource.getMy();
    return User.fromJson(json as Map<String, dynamic>);
  }
}
