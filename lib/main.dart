import 'package:flutter/material.dart';
import 'package:flutteramazingiamges/provider/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter application',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProviderSetup.instance().secondPage(),
    );
  }
}
