import 'package:flutter/material.dart';
import '../../package.dart';

class Signup extends StatefulWidget {
  static String routeName = "/Signup";
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  String? username;
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
  }

  void onSignup() {
    if (username != null && email != null && password != null) {
      api.signup(
        username,
        email,
        password,
        onSuccess: (res) {
          Get.offAll(() => const Splash());
        },
        onError: (message) {
          Snackbar(context, message: message).warning();
        },
      );
    } else {
      Snackbar(context, message: 'Username Email or Password Required!')
          .error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(App.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Picture(
                Assets.image.logo,
                width: App.width,
                height: App.width,
              ),
              const Text('Register Your Account'),
              SizedBox(height: App.padding),
              Input(
                hintText: 'Username',
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      username = null;
                    });
                  } else {
                    setState(() {
                      username = value;
                    });
                  }
                },
              ),
              SizedBox(height: App.padding),
              Input(
                hintText: 'Email',
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      email = null;
                    });
                  } else {
                    setState(() {
                      email = value;
                    });
                  }
                },
              ),
              SizedBox(height: App.padding),
              Input(
                hintText: 'Password',
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      password = null;
                    });
                  } else {
                    setState(() {
                      password = value;
                    });
                  }
                },
              ),
              SizedBox(height: App.padding),
              Button(
                label: 'Sign Up',
                onPressed: onSignup,
              ),
              SizedBox(height: App.padding),
              TextButton(
                onPressed: () {
                  Get.off(() => const Signin());
                },
                child: const Text('Sign In?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
