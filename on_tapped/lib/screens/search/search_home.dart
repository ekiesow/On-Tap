import 'package:flutter/material.dart';
import 'package:on_tapped/screens/search/search_form.dart';

class SearchHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Discover Breweries",
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: QueryForm(),
    );
  }
}
