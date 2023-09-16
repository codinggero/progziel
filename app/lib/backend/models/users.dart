import '/package.dart';

class UsersModel {
  static late Box box;
  static String? id;
  static String? email;
  static String? username;
  static String? bio;
  static int? status;

  get instance => UsersModel();

  static Future initState({String name = "users"}) async {
    box = await Hive.openBox(name);
    id = box.get('id');
    email = box.get('email');
    username = box.get('username');
    bio = box.get('bio');
    status = box.get('status');

    return box;
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
