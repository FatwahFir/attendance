import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static String monthFromNumber(
    int month, {
    String? locale,
    bool isShort = false,
  }) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat(isShort ? 'MMM' : 'MMMM', locale);
    final dateTime = DateTime(2000, month);
    return format.format(dateTime);
  }

  static String dateFromNow(String date, {String? locale}) {
    // make like 1 minute ago makx only day and month
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    final diff = DateTime.now().difference(dateTime);
    // make like 1 minute ago makx only day and month
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit yang lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam yang lalu';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} hari yang lalu';
    } else {
      return format.format(dateTime);
    }
  }

  static String timeFromNow(String time, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('HH:mm', locale);
    final dateTime = DateTime.parse(time);
    return format.format(dateTime);
  }

  static String timeWithoutSec(String time, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final timeWithSec = DateFormat('HH:mm:ss').parse(time);
    final format = DateFormat('HH:mm', locale);
    return format.format(timeWithSec);
  }

  static String timeWithoutSecISO(String time, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');

    final dateTime = DateTime.parse(time);
    final format = DateFormat('HH:mm', locale);

    return format.format(dateTime);
  }

  static String ddMMyyyy(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMMMyyyy(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMyyyyHHmm(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy HH:mm', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMyyyyHHmmss(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy HH:mm:ss', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String convertTime12to24(String time12h) {
    final DateFormat formatter12h = DateFormat('h:mm a');
    DateTime? dateTime = formatter12h.parseLoose(time12h);

    final DateFormat formatter24h = DateFormat('HH:mm:ss');
    return formatter24h.format(dateTime);
  }

  static String convertTime24to12(String time24h) {
    final DateFormat formatter24h = DateFormat('HH:mm:ss');
    DateTime dateTime = formatter24h.parseLoose(time24h);

    final DateFormat formatter12h = DateFormat('h:mm a');
    return formatter12h.format(dateTime);
  }

  static bool isTimeFormat24Hour(String time) {
    // Regular expression to match 24-hour format HH:mm:ss or HH:mm
    final RegExp regExp24Hour =
        RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9](?::[0-5][0-9])?$');
    return regExp24Hour.hasMatch(time);
  }
}
