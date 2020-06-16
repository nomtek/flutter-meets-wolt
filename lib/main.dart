import 'package:flutter/material.dart';
import 'package:flutter_meets_wolt/animated_header/animated_header_route.dart';
import 'package:flutter_meets_wolt/app_bar_buttons/app_bar_buttons_route.dart';
import 'package:flutter_meets_wolt/menu_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter meets Wolt',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        accentColor: Colors.yellowAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/menu",
      routes: {
        '/menu': (_) => MenuRoute(),
        '/app-bar-buttons': (_) => AppBarButtonsRoute(),
        '/animated-header': (_) => AnimatedHeaderRoute(),
        '/like-button': (_) => Scaffold(appBar: AppBar(title: Text("Like button"),), body: Placeholder(),),
      },
    );
  }
}