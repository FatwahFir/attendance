import 'package:attendance/app/data/models/attendance_model.dart';
import 'package:attendance/app/data/providers/base_provider.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:get/get.dart';

class AttendanceProvider extends BaseProvider {
  Future<Response> checkAttendanceStatus(int id) async =>
      get('/attendances/status?user_id=$id');

  Future<List<Attendance>> getTodayAttendance(int id) async {
    var res = await get('/attendances/today/$id');
    return MyUtils.fromJsonList<Attendance>(
        res.body['data'], Attendance.fromJson);
  }

  Future<Response> submitAttendance(var data) async =>
      post('/attendances', data);
}
