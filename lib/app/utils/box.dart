import 'package:attendance/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class Box {
  static final GetStorage _loginState = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static GetStorage get loginState => _loginState;

  static User? get user => User.fromJson(_loginState.read('user'));
  static String? get attendanceStatus => _loginState.read('status');
  // static int? get maxRadius => _loginState.read('maxRadius');
  static int? get maxRadius => user?.userDetails?.location?.maxRadius;

  // static String get role => loginState.read('role');

  // static void setUser(User user) {
  //   _loginState.write('user', user.toJson());
  // }

  static Future<void> setLoginData(Map<String, dynamic> data) async {
    await _loginState.write('user', data);
  }

  static Future<void> setAttendanceStatus(String data) async {
    await _loginState.write('status', data);
  }

  static Future<void> setMaxRadius(int data) async {
    await _loginState.write('maxRadius', data);
  }
}
