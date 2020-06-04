import 'package:flutter/material.dart';

class MenuRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter meets Wolt"),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("App bar buttons"),
              subtitle: Text("part 1"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, '/app-bar-buttons'),
            ),
            ListTile(
              title: Text("Animated header"),
              subtitle: Text("part 2"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, '/animated-header'),
            ),
            ListTile(
              title: Text("Like button"),
              subtitle: Text("part 3"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, '/like-button'),
            ),
          ],
        ));
  }
}
