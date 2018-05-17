import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';
import './PresentationPage.dart';

class Presentation
{
  String _title;
  final String _startTime;
  final String _endTime;

  Presentation(this._title, this._startTime, this._endTime);
  Presentation.demo()
  : _title = "Title"
    , _startTime = "11:00"
    , _endTime = "12:00";

  Card createCard(BuildContext context, Function func) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: Image.asset(getRandomIcon()),
            title: new Text(generateRandomTitle()),
            subtitle: new Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFDDDD),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: new Text("$_startTime - $_endTime")
            ),
            onTap: () { Navigator.push(context, new MaterialPageRoute(builder: (context) => PresentationPage(_title, _startTime, _endTime)));},
            trailing: new RaisedButton(
              elevation: 3.0,
              color: Color(0xFFFFDDDD),
              child: Text("Add"),
              onPressed: (){  },
            ),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[

              ]
            )
          )
        ]
      ),
      elevation: 10.0,
    );
  }
}

String getRandomIcon() {
  var rand = Random();
  switch(rand.nextInt(3)) {
    case 0:
      return 'graphics/CPPIcon.png';
      break;
    case 1:
      return 'graphics/CSharpIcon.png';
      break;
    case 2:
      return 'graphics/ITIcon.png';
      break;
  }

  return "";
}

String generateRandomTitle() {
  var rand = new Random();
  var adj = adjectives[rand.nextInt(adjectives.length)];
  adj = adj[0].toUpperCase() + adj.substring(1);
  var noun = nouns[rand.nextInt(nouns.length)];
  noun = noun[0].toUpperCase() + noun.substring(1);

  return "$adj $noun";
}