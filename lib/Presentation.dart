import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';
import './PresentationPage.dart';
import 'PresentationTime.dart';

class Presentation
{
  String _title;
  final PresentationTime presentationTime = PresentationTime.Random();
  final String _icon;

  double _animatedHeight = 100.0;

  bool OverlappingTime(Presentation p) => p.presentationTime.startHour == presentationTime.startHour && p.presentationTime.day == presentationTime.day;

  Presentation(this._title)
      : _icon = getRandomIcon();

  Presentation.demo()
    : _title = "Title";

  void ToggleCard() => _animatedHeight == 0.0 ? _animatedHeight = 100.0 : _animatedHeight = 0.0;

  AnimatedContainer createCard(BuildContext context, Function func) {
    return AnimatedContainer(
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: Image.asset(_icon),
              title: new Text(_title),
              subtitle: new Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFDDDD),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: new Text("${presentationTime.StartTime()} - ${presentationTime.EndTime()}")
              ),
              onTap: () { Navigator.push(context, new MaterialPageRoute(builder: (context) => PresentationPage(_title)));},
              trailing: new RaisedButton(
                elevation: 3.0,
                color: Color(0xFFFFDDDD),
                child: Text("Add"),
                onPressed: (){ func(); },
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
        elevation: 8.0,
      ),
      height: _animatedHeight,
      width: 100.0,
      duration: const Duration(milliseconds: 120),
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