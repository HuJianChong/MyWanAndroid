import 'package:shared_preferences/shared_preferences.dart';

///本地持久化存储工具类
class SpUtils {
  SpUtils._();
  static Future<bool> saveStringList(String key, List<String> values) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setStringList(key, values);
  }

  static Future<List<String>?> getStringList(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getStringList(key);
  }

  static Future<bool> saveBool(String key, bool value) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  static Future saveString(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, value);
  }

  static Future saveDouble(String key, double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setDouble(key, value);
  }

  static Future saveList(String key, List<String> value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setStringList(key, value);
  }

  static Future getDynamic(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  static Future getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static Future getDouble(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key);
  }

  static Future getList(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> remove(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.remove(key);
  }

  static Future<bool> removeAll(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
