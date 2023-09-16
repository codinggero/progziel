import 'package:flutter/material.dart';
import '/package.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  UsersController users = Get.find<UsersController>();
  PostsController posts = Get.find<PostsController>();

  @override
  void initState() {
    super.initState();
  }

  Widget chip({
    required String label,
    required int index,
    required int selected,
    Color? color,
    double? fontSize = 18,
    void Function()? onPressed,
  }) {
    return RawChip(
      selected: selected == index ? true : false,
      onPressed: onPressed,
      disabledColor: App.dimGray,
      backgroundColor: App.white,
      selectedColor: selected == index ? App.green : App.dimGray,
      showCheckmark: false,
      padding: EdgeInsets.all(App.padding / 2),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selected == index ? App.green : App.dimGray,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: selected == index ? App.white : App.blackRussian,
          fontSize: fontSize,
        ),
      ),
    );
  }

  void dialog({
    required String title,
    required Widget child,
    required void Function()? onPressed,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: child,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Containers(
            bottomLeft: 35,
            bottomRight: 35,
            width: App.width,
            padding: EdgeInsets.all(App.padding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      App.title,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 38,
                        color: App.blackRussian,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 4.0),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Fonts.bell.light),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: App.padding),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: App.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: Picture.imageProvider(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 4),
                              color: Colors.black.withOpacity(
                                0.3,
                              ),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Fonts.pen_to_square.light,
                            color: App.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: App.padding),
                ListTile(
                  title: const Text('Username'),
                  subtitle: Text("${api.username}"),
                  trailing: IconButton(
                    onPressed: () {
                      String? username;
                      dialog(
                        title: 'Edit Username',
                        child: ListBody(
                          children: <Widget>[
                            Input(
                              hintText: "Username",
                              onChanged: (value) {
                                setState(() {
                                  username = value;
                                });
                              },
                            )
                          ],
                        ),
                        onPressed: () {
                          api.update({'username': username}, onSuccess: (res) {
                            Navigator.of(context).pop();
                            setState(() {});
                          }, onError: (message) {
                            Snackbar(context, message: message).warning();
                          });
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text("${api.email}"),
                  trailing: IconButton(
                    onPressed: () {
                      String? email;
                      dialog(
                        title: 'Edit Email',
                        child: ListBody(
                          children: <Widget>[
                            Input(
                              hintText: "Email",
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            )
                          ],
                        ),
                        onPressed: () {
                          api.update({'email': email}, onSuccess: (res) {
                            Navigator.of(context).pop();
                            setState(() {});
                          }, onError: (message) {
                            Snackbar(context, message: message).warning();
                          });
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text('Bio'),
                  subtitle: Text("${api.bio}"),
                  trailing: IconButton(
                    onPressed: () {
                      String? bio;
                      dialog(
                        title: 'Edit Bio',
                        child: ListBody(
                          children: <Widget>[
                            Input(
                              hintText: "Bio",
                              onChanged: (value) {
                                setState(() {
                                  bio = value;
                                });
                              },
                            )
                          ],
                        ),
                        onPressed: () {
                          api.update({'bio': bio}, onSuccess: (res) {
                            Navigator.of(context).pop();
                            setState(() {});
                          }, onError: (message) {
                            Snackbar(context, message: message).warning();
                          });
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: App.padding),
          Containers(
            width: App.width,
            padding: EdgeInsets.all(App.padding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 20,
                        color: App.blackRussian,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        color: App.blackRussian,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ],
                ),
                SizedBox(height: App.padding),
                ListTile(
                  onTap: () {},
                  shape: const Border(
                    bottom: BorderSide(),
                  ),
                  title: const Text('Change Password'),
                  trailing: IconButton(
                    onPressed: () {
                      String? oldPassword;
                      String? newPassword;

                      dialog(
                        title: 'Change Password',
                        child: ListBody(
                          children: <Widget>[
                            Input(
                              hintText: "Old Password",
                              onChanged: (value) {
                                setState(() {
                                  oldPassword = value;
                                });
                              },
                            ),
                            SizedBox(height: App.padding),
                            Input(
                              hintText: "New Password",
                              onChanged: (value) {
                                setState(() {
                                  newPassword = value;
                                });
                              },
                            )
                          ],
                        ),
                        onPressed: () {
                          api.update({
                            'old_password': oldPassword,
                            'new_password': newPassword
                          }, onSuccess: (res) {
                            Navigator.of(context).pop();
                            setState(() {});
                          }, onError: (message) {
                            Snackbar(context, message: message).warning();
                          });
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  onTap: () {
                    api.logout().then((res) {
                      Get.offAll(() => const Splash());
                    });
                  },
                  title: const Text('Logout'),
                  trailing: IconButton(
                    onPressed: () {
                      api.logout().then((res) {
                        Get.offAll(() => const Splash());
                      });
                    },
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: App.padding),
        ],
      ),
    );
  }
}
