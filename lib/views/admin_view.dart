import 'package:app_curso/helper/widgets.dart';
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              // tabs: [
              //   Tab(icon: Icon(Icons.directions_car)),
              //   Tab(icon: Icon(Icons.directions_transit)),
              //   // Tab(icon: Icon(Icons.directions_bike)),
              // ],
              tabs: <Widget>[
                Text("Upload"),
                Text("Total de usuários"),
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
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
              },
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.transparent,
                  ),
                  onPressed: () {}),
            ],
            // --
          ),
          body: TabBarView(
            children: [
              // Icon(Icons.directions_car),
              Upload(),
              Total(),
              // Icon(Icons.directions_bike),
              //
            ],
          ),
        ),
      ),
    );
  }
}

class Upload extends StatelessWidget {
  const Upload({Key key}) : super(key: key);

  static String name = "Upload";
  static IconData icon = Icons.ac_unit;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: () {
    //     Navigator.of(context).pushNamed("screen3");
    //   },
    //   child: Container(
    //     alignment: Alignment.center,
    //     color: Colors.teal,
    //     child: Text(name),
    //   ),
    // );
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: const Text("")),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class Total extends StatelessWidget {
  const Total({Key key}) : super(key: key);

  static String name = "Total";
  static IconData icon = Icons.accessible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("screen3");
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: Text(name),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Categoria selectedUser;
  List<Categoria> categorias = <Categoria>[
    const Categoria(1, 'Selecione a categoria'),
    const Categoria(2, 'Policial'),
    const Categoria(3, 'Fiscal'),
    const Categoria(4, 'Tribunal')
  ];

  final _passController = TextEditingController();

  @override
  void initState() {
    selectedUser = categorias[0];
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _urlController = new TextEditingController();
  final TextEditingController _tituloController = new TextEditingController();
  final TextEditingController _descricaoController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: new Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //
                    new DropdownButton<Categoria>(
                      value: selectedUser,
                      onChanged: (Categoria newValue) {
                        setState(() {
                          selectedUser = newValue;
                        });
                      },
                      items: categorias.map(
                        (Categoria categoria) {
                          return new DropdownMenuItem<Categoria>(
                            value: categoria,
                            child: new Text(
                              categoria.nome,
                              style: new TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    // --
                    SizedBox(
                      height: 8,
                    ),
                    // --
                    TextFormField(
                      controller: _urlController,
                      decoration: InputDecoration(
                          labelText: 'Url',
                          // hintText: "Caption",
                          suffixIcon: CircleIconButton(
                            // icon: Icon(Icons.clear),
                            onPressed: () => _urlController.clear(),
                          )),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.length < 2) {
                          return 'Url obrigatório';
                        }
                      },
                    ),
                    // --
                    TextFormField(
                      controller: _tituloController,
                      decoration: InputDecoration(
                          labelText: 'Título',
                          suffixIcon: CircleIconButton(
                            // icon: Icon(Icons.clear),
                            onPressed: () => _tituloController.clear(),
                          )),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.length < 2) {
                          return 'Título obrigatório';
                        }
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),

                    // --

                    TextFormField(
                      controller: _descricaoController,
                      decoration: InputDecoration(
                          labelText: 'Descrição',
                          suffixIcon: CircleIconButton(
                            // icon: Icon(Icons.clear),
                            onPressed: () => _descricaoController.clear(),
                          )),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.length < 2) {
                          return 'Descrição obrigatório';
                        }
                      },
                    ),
                    // --
                    SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          height: 40.0,
                          minWidth: 100.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: new Text("Cancelar"),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            )
                          },
                          splashColor: Colors.redAccent,
                        ),
                        //
                        new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          height: 40.0,
                          minWidth: 100.0,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: new Text("Salvar"),
                          onPressed: () => {},
                          splashColor: Colors.redAccent,
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class Categoria {
  final int index;
  final String nome;

  const Categoria(this.index, this.nome);
  // final double valor;

  // Categoria(
  //   this.nome,
  //   this.quantidade,
  // );

  @override
  String toString() {
    // return 'Categoria{nome: $nome, quantidade: $index}';
    return 'Categoria{quantidade: $index, nome: $nome }';
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
  // --
  final _formKey = GlobalKey<FormState>();
  // Categoria categoria = Categoria();
  // --
  Categoria selectedCategoria;
  List<Categoria> categorias = <Categoria>[
    const Categoria(1, 'Tribunal'),
    const Categoria(2, 'Fiscal'),
    const Categoria(2, 'Policial')
  ];

  @override
  void initState() {
    selectedCategoria = categorias[0];
  }

  // --
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // TextFormField(
          //   // The validator receives the text that the user has entered.
          //   validator: (value) {
          //     if (value.isEmpty) {
          //       return 'Please enter some text';
          //     }
          //     return null;
          //   },
          // ),
// Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),)
          // Add TextFormFields and RaisedButton here.
        ],
      ),
    );
    // return new Scaffold(
    //   key: scaffoldKey,
    //   appBar: new AppBar(
    //     centerTitle: true,
    //     // --
    //     actions: <Widget>[
    //       // --
    //     ],

    //     // --
    //   ),
    // );
  }
}
