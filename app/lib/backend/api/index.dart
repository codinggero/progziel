import '/package.dart';

class Api {
  late Box box;

  String? id;
  String? token;
  String? email;
  String? username;
  String? bio;
  int? status;

  Https https = Https();

  static get instance => Api();

  Future initState({String name = "store"}) async {
    box = await Hive.openBox(name);
    id = box.get('_id');
    bio = box.get('bio');
    email = box.get('email');
    token = box.get('token');
    status = box.get('status');
    username = box.get('username');
    return box;
  }

  dynamic get(String key, {dynamic defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  Future put(String key, dynamic value) async {
    return box.put(key, value).then((value) async {
      await initState();
      return value;
    });
  }

  Future putAll(Map<dynamic, dynamic> entries) async {
    return box.putAll(entries).then((value) async {
      await initState();
      return value;
    });
  }

  Future isSignin() async {
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  Future signin(
    String? email,
    String? password, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/signin', body: {
      'email': email,
      'password': password,
    });
    if (res.code == 200) {
      await putAll(res.data);
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future signup(
    String? username,
    String? email,
    String? password, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/signup', body: {
      'username': username,
      'email': email,
      'password': password,
    });
    console.log({"res": res.data});
    if (res.code == 201) {
      await putAll(res.data);
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future profile() async {
    Json res = await https.getx('/profile');
    console.log({"res": res.data});
    if (res.code == 200) {
      await putAll(res.data);
    }
  }

  Future update(
    Map<String, dynamic> body, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/profile', body: body);
    if (res.code == 200) {
      await putAll(res.data);
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future posts() async {
    Json res = await https.getx('/posts');
    if (res.code == 200) {
      return res.data;
    } else {
      return [];
    }
  }

  Future postsCreate(
    Map<String, dynamic> body, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/posts', body: body);
    if (res.code == 201) {
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future postsUpdate(
    Map<String, dynamic> body, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/posts/update', body: body);
    if (res.code == 200) {
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future postsDelete(
    Map<String, dynamic> body, {
    required void Function(bool) onSuccess,
    required void Function(dynamic) onError,
  }) async {
    Json res = await https.postx('/posts/delete', body: body);
    if (res.code == 200) {
      onSuccess(true);
    } else {
      onError(res.message);
    }
  }

  Future logout() {
    return box.clear().then((value) {
      return true;
    });
  }
}
