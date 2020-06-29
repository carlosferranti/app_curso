import 'dart:io';

import 'package:app_curso/helper/data_dummer.dart';
import 'package:app_curso/views/settings_view.dart';
import 'package:app_curso/views/uploads_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:app_curso/commons/constants.dart' as Constants;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;

import 'package:octo_image/octo_image.dart';

void main() => runApp(new Upload(
      txtTitulo: null, txtDescricao: null,
    ));

class Upload extends StatelessWidget {
  const Upload({Key key, @required this.txtTitulo, @required this.txtDescricao})
      : super(key: key);
  final String txtTitulo, txtDescricao;
  //
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
      home: new MyHomePage(titulo: txtTitulo, descricao: txtDescricao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.titulo, this.descricao}) : super(key: key);
  final String titulo, descricao;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<IconData> icons = const [
    Icons.sms,
    Icons.mail,
    Icons.phone
  ];
  // --
  var items = [
    {'name': 'Configurações', 'value': 0},
    // {'name': 'Flutter.io', 'value': 1},
    // {'name': 'Google.com', 'value': 2}
  ];
  //
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _validate = false;
  final _tituloController = new TextEditingController();
  final _descricaoController = new TextEditingController();
  //
  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = false;
      _tituloController.text = widget.titulo;
      _descricaoController.text = widget.descricao;
    });
  }

  //
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _tituloController.dispose();
    super.dispose();
  }

  //
  File _image;
  //
  // @override
  // void initState() {
  //   _loading = true;
  //   // TODO: implement initState
  //   super.initState();
  // }
  bool _loading = true;

  //

  // Future<List>

  //
  @override
  Widget build(BuildContext context) {
    //
    _openGallery(BuildContext context) async {
      //
      var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
      this.setState(() {
        _image = picture;
      });
      Navigator.of(context).pop();
    }

    Future<void> _openCamera(BuildContext context) async {
      //
      var cam = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
        _image = cam;
      });
      Navigator.of(context).pop();
    }

    // --
    Future<void> _showSelectionDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Selecione a origem"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      GestureDetector(
                        child: Text("Gallery"),
                        onTap: () {
                          _openGallery(context);
                        },
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      GestureDetector(
                        child: Text("Camera"),
                        onTap: () {
                          _openCamera(context);
                        },
                      )
                    ],
                  ),
                ));
          });
    }

    // --
    final users = {...DUMMY_USER};
    Size size = MediaQuery.of(context).size;
    String _dateTime = '${DateTime.now()}';

    print(' widget.titulo ->> ' + widget.titulo);

    // final _titulo = new TextFormField(
    //   // initialValue: widget.titulo,
    //   // onChanged: (text) {
    //   //   print("First text field: $text");
    //   // },
    //   //  initialValue: 'your initial text',
    //   onChanged: (text) => {widget.titulo},
    //   validator: _validarNome,
    //   controller: _tituloController,
    //   decoration: new InputDecoration(
    //     hintText: "Título",
    //   ),
    // );

    final _titulo = new TextField(
      // initialValue: widget.titulo,
      // onChanged: (text) {
      //   print("First text field: $text");
      // },
      //  initialValue: 'your initial text',
      // validator: _validarNome,
      controller: _tituloController,
      decoration: new InputDecoration(
        hintText: "Título",
      ),
    );

    final _subTitulo = new TextFormField(
      validator: _validarDescricao,
      controller: _descricaoController,
      decoration: new InputDecoration(
        hintText: "Descrição",
      ),
    );

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        // backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aprovação",
              style: TextStyle(fontSize: 12, color: Colors.deepOrange),
            ),
            Text(
              " | ",
              style: TextStyle(fontSize: 12, color: Colors.grey),
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
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) => new UploadsList(),
              ),
            );
          },
        ),
      ),
      // --
      // SingleChildScrollView

      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    autovalidate: _validate,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: InkWell(
                        onTap: () => print("ciao"),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this

                          children: <Widget>[
                            // Center(child: CircularProgressIndicator()),
                            ClipRRect(
                              // borderRadius: BorderRadius.only(
                              //   topLeft: Radius.circular(8.0),
                              //   topRight: Radius.circular(8.0),
                              // ),
                              borderRadius: new BorderRadius.circular(8.0),
                              // child: Image.network('https://placeimg.com/640/480/any',
                              child: GestureDetector(
                                onTap: () {
                                  print('GestureDetector');
                                  _showSelectionDialog(context);
                                },
                                child: _image == null
                                    ? Image.asset(
                                        'assets/images/image_not_found.png',
                                      )
                                    : Image.file(_image),
                              ),
                            ),

                            ListTile(
                              title: _titulo,
                              subtitle: _subTitulo,
                            ),
                            Container(
                              // color: Colors.blue,
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new UploadsList(),
                                        ),
                                      );
                                    },
                                  ),
                                  new FlatButton(
                                    child: const Text(
                                      "Salvar",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onPressed: () {
                                      // se não for válido
                                      if (!_formKey.currentState.validate()) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            new SnackBar(
                                                content: new Text(
                                                    'Erro no processo de gravação')));
                                      } else {
                                        _formKey.currentState.save();
                                        _scaffoldKey.currentState.showSnackBar(
                                            new SnackBar(
                                                content:
                                                    new Text('Dados salvos!')));
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Obrigatório";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarDescricao(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Obrigatório";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }
}
