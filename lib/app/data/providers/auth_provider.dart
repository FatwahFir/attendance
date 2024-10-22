import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:get/get.dart';

class AuthProvider extends BaseProvider {
  Future<Response> login(var data) async => await post('/login', data);
}
