import 'package:flutter/material.dart';
import 'package:magic_app_flutter/api/apiProvider.dart';
import 'package:magic_app_flutter/ui/loadWidget.dart';
import 'package:magic_app_flutter/pages/search/searchCard.dart';
import 'package:magic_app_flutter/api/object/cardResult.dart';
import 'package:magic_app_flutter/api/object/ruling.dart';

class DicePage extends StatefulWidget {
  @override
  DicePageState createState() => new DicePageState();
}

//TODO: put search list stuff in here?
class DicePageState extends State<DicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.casino),
          title: Text("hello")
        ),
        body: Container(
          child: Text("world"),
        )
    );
  }
}