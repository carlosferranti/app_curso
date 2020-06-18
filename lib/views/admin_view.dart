import 'package:app_curso/views/home.dart';
import 'package:flutter/material.dart';

import 'package:app_curso/commons/constants.dart' as Constants;

void main() => runApp(new Admin());

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curso Aprovação',
      theme: new ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: new HomePage(title: 'App'),
      home:
          // --
          DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
           
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            // title: Text('Tabs Demo'),
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              // onPressed:() => Navigator.pushReplacementNamed(context, "/home-page"),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
              },
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {
                // 
              }),
          
            ],
            // --

            // --
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class _HomePageState extends State<HomePage> {
  var items = [
    {'name': 'Configurações', 'value': 0},
    // {'name': 'Flutter.io', 'value': 1},
    // {'name': 'Google.com', 'value': 2}
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        // backgroundColor: Colors.indigo,
        centerTitle: true,
        // --
        actions: <Widget>[
          // --
          // IconButton(
          //   icon: const Icon(Icons.add_alert),
          //   tooltip: 'Show Snackbar',
          //   onPressed: () {
          //     scaffoldKey.currentState.showSnackBar(snackBar);
          //   },
          // ),
          
          // --
          // PopupMenuButton(
          //     onSelected: (x) {
          //       switch (x) {
          //         case 0:
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => Admin()),
          //           );
          //           break;
          //         // case 1:
          //         //   // do something else
          //         //   break;
          //       }
          //     },
          //     icon: Icon(Icons.more_vert),
          //     itemBuilder: (context) => items
          //         .map<PopupMenuItem>((element) => PopupMenuItem(
          //               child: Text(element['name']),
          //               value: element['value'],
          //             ))
          //         .toList())
        ],
        // --
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   // onPressed:() => Navigator.pushReplacementNamed(context, "/home-page"),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         new MaterialPageRoute(
        //           builder: (BuildContext context) => new Home(),
        //         ));
        //   },
        // ),

        // --
      ),
      // drawer: menuDrawer(context) ,
      // body:
      // new Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       new Text(''),
      //     ],
      //   ),
      // ),
    );
  }
}
