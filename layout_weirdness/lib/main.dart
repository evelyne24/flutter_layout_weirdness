import 'package:flutter/material.dart';
import 'package:layout_weirdness/settings.dart';

import 'home.dart';
import 'more_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Weirdness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/settings2': (context) => MoreSettingsScreen()
      },
    );
  }
}
