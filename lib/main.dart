import 'package:flutter/material.dart';

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
        body: new ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return new ListTile(
              title: Text("new thing"),
              enabled: true,
              onTap: () => Navigator.push(context, MaterialPageRoute( builder: (context) => MyOtherPage() )),
              trailing: new IconButton(icon: new Icon(Icons.accessibility, color: Colors.red), tooltip: "Cool...", onPressed: (){},),
            );
          }
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new MyOtherPage())),
        ),
      ),
    );
  }
}

class MyOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My test"),
      ),
      body: Center(
        child: Text("Testing inside"),
      ),
    );
  }
}

class GenerateCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Character"),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text("Character Name"),
              new TextField()
            ]
          )
        ]
      ),
    );
  }
}