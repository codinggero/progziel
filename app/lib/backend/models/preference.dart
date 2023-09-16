import '/package.dart';

class Preferences {
  static late Box box;
  static String? token;

  static Future initState({String name = "preferences"}) async {
    box = await Hive.openBox(name);
    token = box.get('token');
    return box;
  }

  static dynamic get(String key, {dynamic defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  static Future put(String key, dynamic value) async {
    return box.put(key, value).then((value) async {
      await initState();
      return value;
    });
  }

  static Future putAll(Map<dynamic, dynamic> entries) async {
    return box.putAll(entries).then((value) async {
      await initState();
      return value;
    });
  }
}
