import 'package:flutter/material.dart';
import 'PresentationTime.dart';

class PresentationPage extends StatelessWidget {
  final PresentationTime _presentationTime = PresentationTime.Random();
  final String _title;

  PresentationPage(this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("$_title"),
      ),
      body: new Center(
        child: new Text(
          "${_presentationTime.startHour} - ${_presentationTime.endHour}",
          style: new TextStyle(
            fontSize: 20.0,
          )
        ),
      ),
    );
  }
}