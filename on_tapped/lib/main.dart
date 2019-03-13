import 'package:flutter/material.dart';

import 'package:on_tapped/screens/ontapped_home.dart';

void main() => runApp(OnTappedApp());

class OnTappedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Tapped',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: OnTappedHome(),
    );
  }
}


