import 'package:flutter/material.dart';

import 'package:on_tapped/API/obdb_breweries.dart';
import 'package:on_tapped/screens/list/brewery_card.dart' show BuildBreweryCard;

class BreweryListView extends StatelessWidget {
  final List<Brewery> myBreweries;

  const BreweryListView({Key key, this.myBreweries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12.0),
      itemCount: myBreweries.length,
      itemBuilder: _buildBreweryList,
    );
  }

  Widget _buildBreweryList(BuildContext context, int index) {
    Brewery currentBrewery = myBreweries[index];
    return BuildBreweryCard(currentBrewery: currentBrewery,);
  }
}
