import 'package:app_curso/helper/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Settings());

class Settings extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Flutter Hello World'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: builAppBar(context),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // new Text('You have pushed the button this many times:',),
          ],
        ),
      ),
    );
  }
}
