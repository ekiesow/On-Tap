import 'package:flutter/material.dart';

import 'package:on_tapped/API/obdb_breweries.dart';

class BreweryListView extends StatefulWidget {
final List<Brewery> myBreweries;

  const BreweryListView({Key key, @required this.myBreweries}) : super(key: key);

  @override
  _BreweryListViewState createState() => _BreweryListViewState(myBreweries);
}

class _BreweryListViewState extends State<BreweryListView> {
  final List<Brewery> myBreweries;

  _BreweryListViewState(this.myBreweries);

  @override
  Widget build(BuildContext context) {
    Brewery currentBrewery;
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12.0),
        itemCount: myBreweries.length,
        itemBuilder: (BuildContext context, int index) {
          currentBrewery = myBreweries[index];
          return _buildBreweryCard(currentBrewery);
        }
    );
  }

  Widget _buildBreweryCard(Brewery currentBrewery){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          //TODO: create expanded card
          //TODO: add expanded state
          setState(() {
            return buildExpandedCard(currentBrewery);
          });
        },
        child: buildBriefCard(currentBrewery),
      ),
    );
  }

  Card buildBriefCard(Brewery currentBrewery) {
    return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(currentBrewery.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: () {

                    }
                    //TODO: add saved method
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _breweryInfoText(currentBrewery, "${currentBrewery.breweryType} brewery"),
                _breweryInfoText(currentBrewery, "${currentBrewery.city}, ${currentBrewery.state}"),
              ],
            ),
          ],
        ),
      );
  }

  Card buildExpandedCard(Brewery currentBrewery) {
    print("expaneded");
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(currentBrewery.name,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: null
                //TODO: add saved method
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _breweryInfoText(currentBrewery, "${currentBrewery.breweryType} brewery"),
              _breweryInfoText(currentBrewery, "${currentBrewery.street}"),
              _breweryInfoText(currentBrewery, "${currentBrewery.city}, ${currentBrewery.state}"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _breweryInfoText(Brewery currentBrewery, String breweryText){
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
      child: Text(breweryText,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16.0,
        ),
      ),
    );
  }
}


