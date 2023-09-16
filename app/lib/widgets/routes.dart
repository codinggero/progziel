import 'package:flutter/material.dart';
import '/package.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  Splash.routeName: (context) => const Splash(),
  Signin.routeName: (context) => const Signin(),
  Signup.routeName: (context) => const Signup(),
  Home.routeName: (context) => const Home(),
};
