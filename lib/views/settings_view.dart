import 'package:app_curso/views/favorites_view.dart';
import 'package:app_curso/views/geral_view.dart';
import 'package:app_curso/views/home.dart';
import 'package:app_curso/views/upload_view.dart';
import 'package:flutter/material.dart';

import 'package:app_curso/commons/constants.dart' as Constants;

void main() => runApp(new Settings());

class Settings extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                    break;
                  // case 1:
                  //   // do something else
                  //   break;
                }
              },
              icon: Icon(Icons.more_vert, color: Colors.transparent,),
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
                  builder: (BuildContext context) => new Home(),
                ));
          },
        ),
        // --
      ),
      // drawer: menuDrawer(context) ,
      // body: new Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       new Text(''),
      //     ],
      //   ),
      body: buildBody(),
    );
  }
}

buildBody() {
  final titles = ['Upload', 'Configurações', 'Preferências'];

  final icons = [Icons.apps, Icons.settings, Icons.favorite];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        //                           <--
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('???????????????' + titles[index]);

            int k = index;

            switch (k) {
              case 0: // Upload
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Upload()),
                );
                break;
              case 1: // Configurações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Geral()),
                );
                break;

              case 2: // Preferências
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorites()),
                );
                break;
            }
          },
        ),
      );
    },
  );
  // return Container(
  //   padding: EdgeInsets.symmetric(horizontal: 16),
  //   child: ListView(
  //     children: <Widget>[
  //       ListTile(
  //         leading: Icon(Icons.apps),
  //         title: Text('Notícias'),
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.settings),
  //         title: Text('Configurações'),
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.favorite),
  //         title: Text('Álbum'),
  //       ),
  //     ],
  //   ),
  // );
}

// import 'package:flutter/material.dart';

// void main() => runApp(new Settings());

// class Settings extends StatelessWidget {
//   //
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Curso Aprovação',
//       theme: new ThemeData(
//         //
//         // primarySwatch: Colors.blue,
//         primaryColor: Colors.white,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: new HomePage(title: ''),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   HomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomePageState createState() => new _HomePageState();
// }

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       // appBar: builAppBar(context),
//       key: scaffoldKey,
//       appBar: AppBar(
//         // title: const Text('AppBar Demo'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add_alert),
//             tooltip: 'Show Snackbar',
//             onPressed: () {
//               scaffoldKey.currentState.showSnackBar(snackBar);
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.navigate_next),
//             tooltip: 'Next page',
//             onPressed: () {
//               openPage(context);
//             },
//           ),
//         ],
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // new Text('You have pushed the button this many times:',),
//           ],
//         ),
//       ),
//     );
//   }

//   void openPage(BuildContext context) {
//     Navigator.push(context, MaterialPageRoute(
//       builder: (BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Next page'),
//           ),
//           body: const Center(
//             child: Text(
//               'This is the next page',
//               style: TextStyle(fontSize: 24),
//             ),
//           ),
//         );
//       },
//     ));
//   }
// }
