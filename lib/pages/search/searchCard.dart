import 'package:flutter/material.dart';
import 'package:magic_app_flutter/api/object/cardResult.dart';
import 'package:magic_app_flutter/api/object/ruling.dart';
import 'package:magic_app_flutter/api/apiProvider.dart';
import 'package:http/http.dart';

//This stateless because I dont want to do unnecessary api calls
//Also we shouldnt be redrawing a search result
class SearchCardPage extends StatelessWidget {
  final CardResult
      cardResult; //TODO: should I do the query here where it's stateless?
  final List<Ruling> rulings;

  SearchCardPage({this.cardResult, this.rulings});

  Widget _buildImagePage() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Image.network(cardResult.cardImageUrl),
    );
  }

  Widget _buildDataPage() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(cardResult.cardType),
          subtitle: Text("Artist: " + cardResult.artist),
          trailing: Text(cardResult.manaCost),
        ),
        Image.network(cardResult.imageUrl),
        Container(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: ListTile(
            title: Text("Rulings"),
          subtitle: _buildRulingsTable(),
          ),
        ),
      ],
    );
  }

  Widget _buildRulingsTable() {
    if (rulings.length > 0) {
      List<TableRow> rulingsRows = List();

      for (Ruling r in rulings) {
        rulingsRows.add(
          TableRow(children: <TableCell>[
            TableCell(
              child: Text(r.comment),
            ),
            TableCell(
              child: Text(r.publishDate),
            )
          ]),
        );
      }

      return Table(children: rulingsRows);
    }
    else {
      return Text("None");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(cardResult.name),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Image"),
                Tab(text: "Data"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildImagePage(),
              _buildDataPage(),
            ],
          ),
        ));
  }
}
