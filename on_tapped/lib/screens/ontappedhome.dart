import 'package:flutter/material.dart';

import 'package:on_tapped/screens/drawer.dart';
import 'package:on_tapped/API/obdb_breweries.dart';
import 'package:on_tapped/API/obdb_api.dart';
import 'package:on_tapped/screens/brewerylistview.dart';

class OnTappedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("On Tapped",
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      drawer: myDrawer(context),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: create query Form
            //TODO: go to query Form
          },
        child: Icon(Icons.search),
        backgroundColor: Theme.of(context).buttonTheme.colorScheme.background,
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BreweryList>(
      future: getBreweries(),
      builder: (BuildContext context, AsyncSnapshot<BreweryList> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          else if (snapshot.hasData) {
            List<Brewery> myBreweries = snapshot.data.breweries;
              return BreweryListView(myBreweries: myBreweries,);
          }
        }
        else{
          return Center(
              child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}