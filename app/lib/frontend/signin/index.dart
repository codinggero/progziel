import 'package:flutter/material.dart';
import '../../package.dart';

class Signin extends StatefulWidget {
  static String routeName = "/Signin";
  const Signin({super.key});

  @override
  State<Signin> createState() => SigninState();
}

class SigninState extends State<Signin> {
  String? email = "codinggero@gmail.com";
  String? password = "codinggero";

  @override
  void initState() {
    super.initState();
  }

  void onSignIn() {
    if (email != null && password != null) {
      api.signin(
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
      Snackbar(context, message: 'Email or Password Required!').error();
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
              const Text('Please Enter Your Email and Password'),
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
                label: 'Sign In',
                onPressed: onSignIn,
              ),
              SizedBox(height: App.padding),
              TextButton(
                onPressed: () {
                  Get.off(() => const Signup());
                },
                child: const Text('Register?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
