import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:on_tapped/API/obdb_breweries.dart';


String url = 'https://api.openbrewerydb.org/breweries';

Brewery breweryFromJson(String brew) {
  final jsonData = json.decode(brew);
  return Brewery.fromJson(jsonData);
}

BreweryList breweriesFromJson(String brew) {
  final jsonData = json.decode(brew);
  return new BreweryList.fromJson(jsonData);
}

Future<Brewery> getBrewery() async {
  final response = await http.get('$url/1');
  if(response.statusCode == 200) {
    return breweryFromJson(response.body);
  }
  throw Exception('Failed to load post');
}

Future<BreweryList> getBreweries() async {
  final response = await http.get(url);
  if(response.statusCode == 200) {
    return breweriesFromJson(response.body);
  }
  throw Exception('Failed to load post');
}