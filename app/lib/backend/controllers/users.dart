import '/package.dart';

class UsersController extends GetxController {
  Https https = Https();
  var email = ''.obs;
  var password = ''.obs;
  var token = ''.obs;

  Future isSignIn() async {}

  Future<Json> signin({String? email, String? password}) async {
    if (email == null && password == null) {}

    Json res = await https.postx('/signin', body: {
      'email': email,
      'password': password,
    });
    if (res.code == 200) {}
    update();
    return res;
  }

  Future<Json> signup(String username, String email, String password) async {
    Json res = await https.postx('/signin', body: {
      'email': email,
      'password': password,
      'username': username,
    });
    if (res.code == 200) {}
    update();
    return res;
  }

  Future profile() async {}

  Future logout() async {}
}
