import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  void doSearch(String search) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text(search));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: TextField(
              onSubmitted: doSearch,
            ),
          )
        ],
      )
    );
  }
}