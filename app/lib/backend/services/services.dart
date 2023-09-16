import '/package.dart';

class Services extends GetxService {
  Https https = Https();

  Future initState() async {
    await Preferences.initState();
    await UsersModel.initState();
    await PostsModel.initState();

    return Service();
  }
}
