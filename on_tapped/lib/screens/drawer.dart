import 'package:flutter/material.dart';

Drawer myDrawer(BuildContext context) {
  return new Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Filter',
            style: TextStyle(
              fontFamily: 'Roboto',
            ),
          ),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .backgroundColor,
          ),
        ),
        ListTile(
          title: Text('State'),

        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 80.0),
          child: RaisedButton(onPressed: () => Navigator.pop(context),
            highlightColor: Theme.of(context).buttonColor,
          ),
        )
      ],
    ),
  );
}
