import 'package:flutter/material.dart';
import '../../package.dart';

class Splash extends StatefulWidget {
  static String routeName = "/";
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  UsersController users = Get.find<UsersController>();

  @override
  void initState() {
    super.initState();
    api.isSignin().then((signin) async {
      if (!signin) {
        return Get.offAll(() => const Signin());
      } else {
        await api.profile();
        return Get.offAll(() => const Home());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Picture(
          Assets.image.splash,
          width: App.wp(30),
          height: App.wp(30),
        ),
      ),
    );
  }
}
