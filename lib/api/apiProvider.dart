import 'dart:convert';
import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;
import 'object/autocomplete.dart';
import 'object/cardResult.dart';

void main() {
  //Testing http calls
//  apiProvider.autocompleteRequest('nissa')
//      .then((response) => {
//        print(Autocomplete.fromJson(json.decode(response.body)).toString())
//  });
//
//  apiProvider.searchRequest('Zurgo Helmsmasher')
//      .then((response) => {
//  print(CardResult.fromJson(json.decode(response.body)).toString())
//  });
}

enum Query { AUTOCOMPLETE, SEARCH_NAMED, IMAGE }

class ApiProvider {
  static const base = 'https://api.scryfall.com';
  static const autocomplete = base + '/cards/autocomplete?q=%s';
  static const search_name = base + '/cards/named?exact=%s';

  static Future<http.Response> autocompleteRequest(String s) async {
    String query = sprintf(autocomplete, [s]);
    return http.get(Uri.encodeFull(query));
  }

  static Autocomplete parseAutocompleteResponse(http.Response response) {
    return Autocomplete.fromJson(json.decode(response.body));
  }

  static Future<http.Response> searchRequest(String s) async {
    String query = sprintf(search_name, [s]);
    return http.get(Uri.encodeFull(query));
  }

  static CardResult parseCardSearchResponse(http.Response response) {
    return CardResult.fromJson(json.decode(response.body));
  }
}
