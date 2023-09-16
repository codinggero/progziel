import '/package.dart';

export 'users.dart';
export 'posts.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => PostsController());
  }
}
