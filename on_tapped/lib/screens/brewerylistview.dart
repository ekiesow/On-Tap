import 'package:flutter/material.dart';

import 'package:on_tapped/API/obdb_breweries.dart';

Widget breweryListView(List<Brewery> myBreweries) {
  return ListView.builder(
    physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12.0),
      itemCount: myBreweries.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(myBreweries[index].name,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Brewery type: ${myBreweries[index].breweryType}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ),
        );
      }
  );
}