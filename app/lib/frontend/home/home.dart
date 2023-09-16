import 'package:flutter/material.dart';
import '/package.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  List posts = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    api.posts().then((docs) {
      setState(() {
        posts = docs;
      });
    });
  }

  void dialog({
    required String title,
    required Widget child,
    required String label,
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
              child: Text(label),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Post",
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
                      onPressed: () {
                        String? title;
                        String? content;

                        dialog(
                          title: "Add Post",
                          label: "Post",
                          child: ListBody(
                            children: <Widget>[
                              Input(
                                hintText: "title",
                                onChanged: (value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                              ),
                              SizedBox(height: App.padding),
                              Input(
                                hintText: "content",
                                onChanged: (value) {
                                  setState(() {
                                    content = value;
                                  });
                                },
                              )
                            ],
                          ),
                          onPressed: () {
                            api.postsCreate(
                                {"title": title, "content": content},
                                onSuccess: (res) {
                              init();
                              Navigator.of(context).pop();
                            }, onError: (message) {
                              Snackbar(context, message: message).warning();
                            });
                          },
                        );
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: App.padding),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'List of Post:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: posts.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1.0,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index]['title']),
                    subtitle: Text(posts[index]['content']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            String? id = posts[index]['_id'];
                            String? title = posts[index]['title'];
                            String? content = posts[index]['content'];
                            dialog(
                              title: "Update Post",
                              label: "Update",
                              child: ListBody(
                                children: <Widget>[
                                  Input(
                                    labelText: "title",
                                    hintText: title,
                                    onChanged: (value) {
                                      setState(() {
                                        title = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: App.padding),
                                  Input(
                                    labelText: "content",
                                    hintText: content,
                                    onChanged: (value) {
                                      setState(() {
                                        content = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                              onPressed: () {
                                api.postsUpdate({
                                  "id": id,
                                  "title": title,
                                  "content": content
                                }, onSuccess: (res) {
                                  init();
                                  Navigator.of(context).pop();
                                }, onError: (message) {
                                  Snackbar(context, message: message).warning();
                                });
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            String? id = posts[index]['_id'];
                            dialog(
                              title: "Delete Post",
                              label: "Delete",
                              child: const ListBody(
                                children: <Widget>[Text("Are You Sure?")],
                              ),
                              onPressed: () {
                                api.postsDelete({
                                  "id": id,
                                }, onSuccess: (res) {
                                  init();
                                  Navigator.of(context).pop();
                                }, onError: (message) {
                                  Snackbar(context, message: message).warning();
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
