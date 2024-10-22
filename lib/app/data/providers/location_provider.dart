import 'package:attendance/app/data/models/location_model.dart';
import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:get/get.dart';

class LocationProvider extends BaseProvider {
  Future<List<Location>> getLocations() async {
    var res = await get('/locations');
    return MyUtils.fromJsonList<Location>(res.body['data'], Location.fromJson);
  }

  Future<Response> addLocation(var data) async =>
      await post('/locations', data);
}
