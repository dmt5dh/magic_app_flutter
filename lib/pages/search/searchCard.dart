import 'package:flutter/material.dart';
import 'package:magic_app_flutter/api/object/cardResult.dart';
import 'package:magic_app_flutter/api/object/ruling.dart';

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
          subtitle: Text(cardResult.setName),
          trailing: Text(cardResult.manaCost),
        ),
        Image.network(cardResult.imageUrl),
        Container(
          child: Text(
            cardResult.artist,
            textAlign: TextAlign.right,
            style: TextStyle(decorationColor: Colors.grey),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Rulings",
                textAlign: TextAlign.left,
              ),
              _buildRulingsTable(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRulingsTable() {
    if (rulings.length > 0) {
      List<TableRow> rulingsRows = List();

      for (var i = 0; i < rulings.length; i++) {
        int currentIndex = i + 1;
        String indexStr = currentIndex.toString() + ". ";

        rulingsRows.add(
          TableRow(children: <TableCell>[
            TableCell(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Text(indexStr + rulings[i].comment),
            )),
          ]),
        );
      }

      return Table(children: rulingsRows);
    } else {
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
                Tab(text: "Rulings"),
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
