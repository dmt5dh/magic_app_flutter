import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

void main() => runApp(MagicApp());

class MagicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        title: 'Magic App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomePage(),
    );
  }
}
