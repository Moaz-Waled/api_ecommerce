import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  int? getDataInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  bool? getDataBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  double? getDataDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  List<String>? getDataStringList({required String key}) {
    return sharedPreferences.getStringList(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
