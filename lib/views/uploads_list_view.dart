import 'dart:async';

import 'package:app_curso/views/home.dart';
import 'package:app_curso/views/settings_view.dart';
import 'package:app_curso/views/upload_view.dart';
import 'package:flutter/material.dart';
import 'package:app_curso/commons/constants.dart' as Constants;
import 'dart:math' as math;

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new UploadsList());

class UploadsList extends StatelessWidget {
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
      home: new HomePage(title: 'App'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _HomePageState extends State<HomePage> {
  // --
  TextEditingController searchController = TextEditingController();
  // final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  final _debouncer = Debouncer(milliseconds: 250);
  List<User> users = List();
  List<User> filteredUsers = List();
  String filter;

  @override
  void initState() {
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  //  static List<String> mainDataList = [
  //  "Apple",
  //  "Apricot",
  //  "Banana",
  //  "Blackberry",
  //  "Coconut",
  //  "Date",
  //  "Fig",
  //  "Gooseberry",
  //  "Grapes",
  //  "Lemon",
  //  "Litchi",
  //  "Mango",
  //  "Orange",
  //  "Papaya",
  //  "Peach",
  //  "Pineapple",
  //  "Pomegranate",
  //  "Starfruit"
  // ];

  // Copy Main List into New List.
  // List<String> newDataList = List.from(mainDataList);

  // var items_news = List<String>();

  var items = [
    {'name': 'Configurações', 'value': 0},
    // {'name': 'Flutter.io', 'value': 1},
    // {'name': 'Google.com', 'value': 2}
  ];

  //
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.grey[200],

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
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {/*  */},
            color: Colors.transparent,
          ),
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
      body: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredUsers = users
                        .where((u) => (u.name
                                .toLowerCase()
                                .contains(string.toLowerCase()) ||
                            u.email
                                .toLowerCase()
                                .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
              // onChanged: (value) {
              //   filterSearchResults(value);
              // },
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Pesquisa",
                hintText: "Pesquisa",
                // prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(18.0),
                // ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12.0),
              shrinkWrap: true,
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                // return Text('${contacts[index]}');

                // if (index > 0) {
                return ListTile(
                  // leading: Icon(Icons.playlist_play, color: Colors.blue),
                  // leading: const Icon(Icons.album),
                  // title: Text(filteredUsers[index].name),
                  title: Text(filteredUsers[index].name,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(filteredUsers[index].email),
                  dense: true,
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    // Icon(Icons.flight),
                    Icon(Icons.arrow_forward_ios)
                  ]),
                  onTap: () {
                    print('%%%%%%% ' + users[index].name);
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => Upload(
                            txtTitulo: users[index].name,
                            txtDescricao: users[index].email),
                      ),
                    );
                  },
                );
                // } else {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
              },
            ),
          ),
        ]),
      ),
    );
  }
}

List<Contact> contacts = [
  Contact(fullName: 'Pratap Kumar', email: 'pratap@example.com'),
  Contact(fullName: 'Jagadeesh', email: 'Jagadeesh@example.com'),
  Contact(fullName: 'Srinivas', email: 'Srinivas@example.com'),
  Contact(fullName: 'Narendra', email: 'Narendra@example.com'),
  Contact(fullName: 'Sravan ', email: 'Sravan@example.com'),
  Contact(fullName: 'Ranganadh', email: 'Ranganadh@example.com'),
  Contact(fullName: 'Karthik', email: 'Karthik@example.com'),
  Contact(fullName: 'Saranya', email: 'Saranya@example.com'),
  Contact(fullName: 'Mahesh', email: 'Mahesh@example.com'),
];

class Contact {
  final String fullName;
  final String email;

  const Contact({this.fullName, this.email});
}

// ----------------------------------------------------------------------------------
// Create Model Class
// ----------------------------------------------------------------------------------

class User {
  int id;
  String name;
  String email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
    );
  }
}

// ----------------------------------------------------------------------------------
// Service Class
// ----------------------------------------------------------------------------------

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
