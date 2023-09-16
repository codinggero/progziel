import '/package.dart';

class PostsController {
  Https https = Https();
  UsersModel users = UsersModel();

  Future<Json> signin(String email, String password) async {
    return await https.postx('/signin', body: {
      'email': email,
      'password': password,
    });
  }

  Future<Json> signup(String username, String email, String password) async {
    return await https.postx('/signup', body: {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  Future<Json> profile() async {
    return await https.getx('/profile');
  }

  Future logout() async {
    return Preferences.put('token', null).then((value) {
      return true;
    });
  }
}
