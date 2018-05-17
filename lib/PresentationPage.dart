import 'package:flutter/material.dart';


class PresentationPage extends StatelessWidget {
  final String _title;
  final String _startTime;
  final String _endTime;

  PresentationPage(this._title, this._startTime, this._endTime);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("$_title"),
      ),
      body: new Center(
        child: new Text(
          "$_startTime - $_endTime",
          style: new TextStyle(
            fontSize: 20.0,
          )
        ),
      ),
    );
  }
}