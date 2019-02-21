import 'package:flutter/material.dart';

import 'package:on_tapped/screens/ontappedhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Tapped',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: OnTappedHome()
    );
  }
}


