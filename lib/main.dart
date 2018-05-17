import 'package:flutter/material.dart';
import './Presentation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Presentation p = Presentation.demo();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My app",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("GTS-X"),
        ),
        body: new ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return p.createCard(
              context,
              () {
              }
            );
          }
        ),
      ),
    );
  }
}

