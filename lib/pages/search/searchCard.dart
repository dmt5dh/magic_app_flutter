import 'package:flutter/material.dart';
import 'package:magic_app_flutter/api/object/cardResult.dart';

//This stateless because I dont want to do unnecessary api calls
//Also we shouldnt be redrawing a search result
class SearchCardPage extends StatelessWidget {
  final CardResult cardResult;

  SearchCardPage({this.cardResult});

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
          title: Text(cardResult.name,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(cardResult.cardType),
          trailing: Text(cardResult.manaCost),
        ),
        Image.network(cardResult.imageUrl),
        ListTile(
          title: Text(cardResult.oracleText),
//          subtitle: Text(cardResult.flavorText),
        ),
//        Container(
//          padding: EdgeInsets.all(20.0),
//          child: Table(children: <TableRow>[
//            TableRow(children: <Widget>[Text("Rarity"), Text(cardResult.rarity)]),
//            TableRow(children: <Widget>[Text("Power"), Text(cardResult.power)]),
//            TableRow(children: <Widget>[Text("Toughness"), Text(cardResult.toughness)]),
//            TableRow(children: <Widget>[Text("Set"), Text(cardResult.setName)]),
//          ]),
//        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
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
