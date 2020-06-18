import 'package:app_curso/helper/data_dummer.dart';
import 'package:app_curso/views/home.dart';
import 'package:app_curso/views/settings_view.dart';
import 'package:app_curso/widgets/component.dart';
import 'package:flutter/material.dart';

import 'package:app_curso/commons/constants.dart' as Constants;

void main() => runApp(new Upload());

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curso Aprovação',
      theme: new ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyHomePage(title: 'App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = [
    {'name': 'Configurações', 'value': 0},
    // {'name': 'Flutter.io', 'value': 1},
    // {'name': 'Google.com', 'value': 2}
  ];
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USER};
    return new Scaffold(
      appBar: new AppBar(
        // backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aprovação",
              style: TextStyle(fontSize: 14, color: Colors.deepOrange),
            ),
            Text(
              " | ",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              "News",
              style: TextStyle(
                fontSize: 14,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        // --
        actions: <Widget>[
          // --
          PopupMenuButton(
              onSelected: (x) {
                switch (x) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Upload()),
                    );
                    break;
                  // case 1:
                  //   // do something else
                  //   break;
                }
              },
              icon: Icon(Icons.add),
              itemBuilder: (context) => items
                  .map<PopupMenuItem>((element) => PopupMenuItem(
                        child: Text(element['name']),
                        value: element['value'],
                      ))
                  .toList())
        ],
        // --
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // onPressed:() => Navigator.pushReplacementNamed(context, "/home-page"),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) => new Settings(),
                ));
          },
        ),
        // --
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // var person = Noticias()
          //   ..ativo = true
          //   ..dataHora = DateTime.now()
          //   ..name = "";

          // Navigator.push(
          //     context,
          //     // MaterialPageRoute(builder: (context) => PersonPage(person)),
          //     null);
        },
      ),
      // drawer: menuDrawer(context) ,
      body: ListView.builder(
          itemCount: users.length,
          // itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name)),
           itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      // new Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       new Text(''),
      //     ],
      //   ),
      // ),
    ));
  }
}
