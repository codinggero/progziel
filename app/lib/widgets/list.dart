import 'package:flutter/material.dart';
import '/package.dart';

class Naat extends StatelessWidget {
  const Naat({super.key});

  @override
  Widget build(BuildContext context) {
    return Containers(
      width: App.width,
      color: App.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(App.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    fontSize: 20,
                    color: App.blackRussian,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
                Text(
                  'More',
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
          ),
          SizedBox(height: App.padding / 2),
          Card(
            color: App.white,
            margin: EdgeInsets.symmetric(horizontal: App.padding / 2),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: App.dimGray,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              selectedColor: App.white,
              focusColor: App.white,
              tileColor: App.white,
              selectedTileColor: App.white,
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: Picture.imageProvider(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Qur%27an_and_Rehal.jpg/640px-Qur%27an_and_Rehal.jpg'),
              ),
              title: const Text('Title'),
              subtitle: const Text('Subtitle'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Fonts.circle_info.light,
                ),
              ),
            ),
          ),
          SizedBox(height: App.padding),
        ],
      ),
    );
  }
}
