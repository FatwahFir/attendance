import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:get/get.dart';

class HomeProvider extends BaseProvider {
  Future<Response> updateMaxRadius(int radius) async => post(
        '/app-config',
        {'_method': 'put', 'max_radius': radius},
      );
  Future<Response> getInfo() async => get(
        '/home',
      );
}
