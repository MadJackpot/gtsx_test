import 'package:flutter/material.dart';
import 'package:gtsx_test/PresentationTime.dart';
import './Presentation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My app",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("GTS-X"),
        ),
        body: new PresentationList(),
      ),
    );
  }
}

class PresentationList extends StatefulWidget {
  List<Presentation> _presentations = new List<Presentation>();

  PresentationList() {
    for (int x = 0; x < 50; ++x)
      _presentations.add(new Presentation(generateRandomTitle()));

    _presentations.sort((a, b) => a.presentationTime.CompareTo(b.presentationTime));
  }
  @override
  State<StatefulWidget> createState() {
    return new PresentationListState(_presentations);
  }

}

class PresentationListState extends State<PresentationList> {
  List<Presentation> _presentations;

  PresentationListState(List<Presentation> presentations) {
    _presentations = presentations;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _presentations.length + uniqueDays(_presentations),
      itemBuilder: (context, index) {
        if (index == 0 || _presentations[index-1].presentationTime.day != _presentations[index].presentationTime.day) {
            return new Container(
              child: new Text("${_presentations[index].presentationTime.DayToString()}",
                style: new TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.25,
              ),
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 5.0),
            );
        }

        return _presentations[index].createCard(
            context,
                () {
              setState(() {
                for (var p in _presentations) {
                  if (p.OverlappingTime(_presentations[index]))
                    p.ToggleCard();
                }
              });
            }
        );
      },
    );
  }
}

int uniqueDays(List<Presentation> presentations) {
  Set<Day> days;
  for (var presentation in presentations)
    days.add(presentation.presentationTime.day);
  return days.length;
}