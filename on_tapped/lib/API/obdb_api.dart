import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:on_tapped/API/obdb_breweries.dart';

final String defaultUrl = 'https://api.openbrewerydb.org/breweries?by_city=Chico&by_state=CA&sort=+name';

Brewery breweryFromJson(String brew) {
  final jsonData = json.decode(brew);
  return Brewery.fromJson(jsonData);
}

BreweryList breweriesFromJson(String brew) {
  final jsonData = json.decode(brew);
  return new BreweryList.fromJson(jsonData);
}

Future<Brewery> getBrewery() async {
  final response = await http.get('$defaultUrl/1');
  if(response.statusCode == 200) {
    return breweryFromJson(response.body);
  }
  throw Exception('Failed to load post');
}

Future<BreweryList> getBreweries() async {
  final response = await http.get(defaultUrl);
  if(response.statusCode == 200) {
    return breweriesFromJson(response.body);
  }
  throw Exception('Failed to load post');
}
