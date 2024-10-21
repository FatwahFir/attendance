class MyUtils {
  static List<T> fromJsonList<T>(
      List? data, T Function(Map<String, dynamic>) fromJson) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}
