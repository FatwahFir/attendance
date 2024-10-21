import 'package:attendance/app/data/models/user_model.dart';
import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:get/get.dart';

class UserProvider extends BaseProvider {
  Future<List<User>> getUsers() async {
    var res = await get('/users');
    return MyUtils.fromJsonList<User>(res.body['data'], User.fromJson);
  }

  Future<Response> setUserLocation(var data) async =>
      await post('/user/set-location', data);
}
