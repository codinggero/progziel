import 'package:flutter/material.dart';
import '/package.dart';

Future services() async {
  await Get.putAsync(() async => await Services().initState());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await services();
  await api.initState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    App(context);
    return GetMaterialApp(
      title: App.title,
      debugShowCheckedModeBanner: false,
      theme: App.theme,
      routes: routes,
      initialRoute: Splash.routeName,
      initialBinding: InitialBinding(),
    );
  }
}
