import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:get/get.dart';

class AuttendanceProvider extends BaseProvider {
  Future<Response> checkAttendanceStatus(int id) async =>
      get('/attendances/status?user_id=$id');

  Future<Response> submitAttendance(var data) async =>
      post('/attendances', data);
}
