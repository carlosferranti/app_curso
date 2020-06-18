import 'package:app_curso/helper/data_dummer.dart';
import 'package:app_curso/views/settings_view.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController tituloController = new TextEditingController();
  TextEditingController descricaoController = new TextEditingController();
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

      // --

      // --

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //
        },
      ),
      // drawer: menuDrawer(context) ,
      // body: ListView.builder(
      //     itemCount: users.length,
      //     itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name)),
      // //  itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      body:
          // Container(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          // child:
          Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // TextFormField(
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Product Title',
              //     fillColor: Colors.grey[300],
              //     filled: true,
              //   ),

              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Please enter Product Title';
              //     }
              //   },

              //   // onSaved: (value) => title = value
              // ),
              TextFormField(
                controller: tituloController,
                decoration:
                    InputDecoration(labelText: "Título", hintText: "Título"),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                    labelText: "Descrição", hintText: "Descrição"),
              ),
              SizedBox(
                height: 16,
              ),
              // DropdownButton<String>(
              //   // value: productType,

              //   onChanged: (String newValue) {
              //     setState(() {
              //       // productType = newValue;
              //     });
              //   },

              //   items: <String>['Bag', 'Computer', 'Dress', 'Phone', 'Shoes']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              // RaisedButton(
              //   splashColor: Colors.red,
              //   onPressed: () async {
              //     if (_formKey.currentState.validate()) {
              //       _formKey.currentState.save();

              //       // await productProvider.addProduct(Product(name: title,price: price,img: productType.toLowerCase()));

              //       Navigator.pop(context);
              //     }
              //   },
              //   child:
              //       Text('add Product', style: TextStyle(color: Colors.white)),
              //   color: Colors.blue,
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new SizedBox(
                    width: 140.0,
                    // height: 100.0,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Cancelar".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 140.0,
                    // height: 100.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Salvar".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // TextField(
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(),
      //   ),
      // ),

      //     TextField(
      //   decoration: InputDecoration(
      //     hintText: "Hint text sample",
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(5.0),
      //       borderSide: BorderSide(
      //         color: Colors.amber,
      //         style: BorderStyle.solid,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
