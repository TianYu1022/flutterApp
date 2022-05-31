import 'package:shared_preferences/shared_preferences.dart';

class HiCache {
  static HiCache? _instance;
  SharedPreferences? prefs;

  HiCache._pre(this.prefs);

  /// 单例预初始化，防止在使用get时，prefs还未完成初始化
  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  static HiCache getInstance() => _instance ??= HiCache._();

  HiCache._() {
    init();
  }

  void init() async => prefs ??= await SharedPreferences.getInstance();

  setString(String key, String value) => prefs?.setString(key, value);

  setInt(String key, int value) => prefs?.setInt(key, value);

  setDouble(String key, double value) => prefs?.setDouble(key, value);

  setBool(String key, bool value) => prefs?.setBool(key, value);

  setStringList(String key, List<String> value) =>
      prefs?.setStringList(key, value);

  /// 移除指定 key 数据
  remove(String key) => prefs?.remove(key);

  /// 清空缓存数据
  clear() => prefs?.clear;

  T get<T>(String key) => prefs?.get(key) as T;
}
