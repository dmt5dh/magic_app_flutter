import 'package:flutter/material.dart';
import 'pages/score.dart';

void main() => runApp(MagicApp());

class MagicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Magic App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
          appBar: new AppBar(
            title: const Text("Magic App"),
          ),
          resizeToAvoidBottomPadding: false,
          body: ScorePage(),
        )
    );
  }
}
