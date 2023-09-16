import 'package:flutter/material.dart';

import 'home.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  static String routeName = '/Home';

  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int index = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  void onChange(i) {
    setState(() {
      index = i;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTap(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: index,
          selectedItemColor: Colors.amber[800],
          onTap: onTap,
        ),
        body: index == 0 ? const Body() : const Profile(),
      ),
    );
  }
}
