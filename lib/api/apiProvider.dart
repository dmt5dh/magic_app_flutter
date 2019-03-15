import 'dart:convert';
import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;
import 'object/autocomplete.dart';
import 'object/cardResult.dart';
import 'object/ruling.dart';

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

//  ApiProvider.getCardRulings("https://api.scryfall.com/cards/3ff91245-57d8-4020-b260-495c938a515b/rulings")
//      .then((response) {
//        List<Ruling> asdf = ApiProvider.parseRulingResponse(response);
//        print(asdf[0].toString());
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

  static Future<http.Response> getCardRulings(String rulingsUrl) async {
    return await http.get(Uri.encodeFull(rulingsUrl));
  }

  static List<Ruling> parseRulingResponse(http.Response response) {
    List<Ruling> rulings = List();
    Map<String, dynamic> rulingJson = json.decode(response.body);

    for(dynamic rule in rulingJson['data']) {
      rulings.add(Ruling.fromJson(rule));
    }

    return rulings;
  }
}
