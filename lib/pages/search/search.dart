import 'package:flutter/material.dart';
import 'package:magic_app_flutter/api/apiProvider.dart';
import 'package:magic_app_flutter/ui/loadWidget.dart';
import 'package:magic_app_flutter/pages/search/searchCard.dart';
import 'package:magic_app_flutter/api/object/cardResult.dart';
import 'package:magic_app_flutter/api/object/ruling.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

//TODO: put search list stuff in here?
class SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  Widget _childDisplay = Container();
  var _data;

  void _displayCardSearch(String s) {
//    setState(() {
//      _childDisplay = LoadingWidget(); // Show loading while waiting for response
//    });
    ApiProvider.searchRequest(s)
        .then((response) {
          CardResult cardResult = ApiProvider.parseCardSearchResponse(response);
          ApiProvider.getCardRulings(cardResult.rulingsUrl).then((response) {
            List<Ruling> rulings = ApiProvider.parseRulingResponse(response);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCardPage(cardResult: cardResult, rulings: rulings)));
          });
    });
  }

  Widget buildAutoCompleteList() {
    if(_data != null) {
      _childDisplay =  ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_data.data[index]),
              onTap: () {
                _displayCardSearch(_data.data[index]);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _data.data.length
      );
    }
    else {
      _childDisplay = Container();
    }

    return _childDisplay;
  }

  void _testSearch() {
    if(searchController.text.length > 3) {
      ApiProvider.autocompleteRequest(searchController.text)
          .then((response) async {
            if(response.statusCode == 200) {
              setState(() {
                _data = ApiProvider.parseAutocompleteResponse(response);
              });
            }
      });
    }
    else {
      setState(() {
        _data = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(_testSearch);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: TextField(
          controller: searchController,
          cursorColor: Colors.white, //TODO: update this theme
        ),
      ),
        body: Container(
      child: buildAutoCompleteList(),
    )
    );
  }
}