import 'package:flutter/material.dart';
import 'package:historica/home_page.dart';

void main() => runApp(Historica());

class Historica extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
