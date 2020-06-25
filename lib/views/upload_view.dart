import 'dart:io';

import 'package:app_curso/helper/data_dummer.dart';
import 'package:app_curso/views/settings_view.dart';
import 'package:flutter/material.dart';

import 'package:app_curso/commons/constants.dart' as Constants;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
  //
  final _formKey = GlobalKey<FormState>();
  TextEditingController tituloController = new TextEditingController();
  TextEditingController descricaoController = new TextEditingController();
  //

  // File _image;

  Widget showImage() {
    return null;
  }

  File _image;

  //
  //
  // Widget imageFromGallery() {
  //   return FutureBuilder<File>(
  //       future: imageFile,
  //       builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           if (null == snapshot.data) {
  //             return Text("Erro");
  //           }
  //           return Image.file(snapshot.data);
  //         }
  //         if (null != snapshot.error) {
  //           return const Text(
  //             "Erro image",
  //             textAlign: TextAlign.center,
  //           );
  //         }
  //         return const Text(
  //           'Sem imagem selecionada',
  //           textAlign: TextAlign.center,
  //         );
  //       });
  // }

  //
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

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
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      // backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image != null)
                              ? Image.file(_image, fit: BoxFit.fill)
                              : Image.network(
                                  "https://i2.wp.com/paranashop.com.br/wp-content/uploads/2019/11/00282966.jpg?w=800&ssl=1",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nighel Mansel',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Color(0xff476cfb),
                      ),
                    ),
                  ),
                ],
              ),
              // --------------------------------------------------------------------
            ],
          ),
        ),
      ),
      // SingleChildScrollView(
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 8),
      //     child: Padding(
      //       padding: EdgeInsets.all(12),
      //       child: Form(
      //         key: _formKey,
      //         child: Expanded(
      //           child: Column(
      //             children: <Widget>[
      //               //
      //               new Text(
      //                 'Imagem',
      //                 style: new TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 14.0,
      //                 ),
      //               ),
      //               //
      //               Container(
      //                 // margin: const EdgeInsets.all(10),
      //                 width: 250,
      //                 height: 200,
      //                 // child: (_image != null) ? Image.file(_image) : Placeholder(),

      //                 child: null,
      //               ),
      //               //
      //               TextFormField(
      //                 controller: tituloController,
      //                 decoration: InputDecoration(
      //                   labelText: "Título",
      //                   hintText: "Título",
      //                   // suffixIcon: IconButton(
      //                   //   onPressed: () {
      //                   //     tituloController.clear();
      //                   //   },
      //                   //   icon: Icon(
      //                   //     Icons.clear,
      //                   //     // color: Colors.blue,
      //                   //   ),
      //                   //   // ),
      //                   //   // border: OutlineInputBorder(
      //                   //   //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
      //                   // ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 16,
      //               ),
      //               TextFormField(
      //                 controller: descricaoController,
      //                 decoration: InputDecoration(
      //                     labelText: "Descrição", hintText: "Descrição"),
      //               ),
      //               SizedBox(
      //                 height: 16,
      //               ),
      //               TextFormField(
      //                 controller: descricaoController,
      //                 decoration: InputDecoration(
      //                     labelText: "Descrição", hintText: "Descrição"),
      //               ),
      //               SizedBox(
      //                 height: 16,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   new SizedBox(
      //                     width: 120.0,
      //                     // height: 100.0,
      //                     child: new RaisedButton(
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(18.0),
      //                           side: BorderSide(color: Colors.blue)),
      //                       onPressed: () {
      //                         Navigator.push(
      //                             context,
      //                             new MaterialPageRoute(
      //                               builder: (BuildContext context) =>
      //                                   new Settings(),
      //                             ));
      //                       },
      //                       color: Colors.blue,
      //                       textColor: Colors.white,
      //                       child: Text("Cancelar".toUpperCase(),
      //                           style: TextStyle(fontSize: 12)),
      //                     ),
      //                   ),
      //                   SizedBox(width: 10),
      //                   SizedBox(
      //                     width: 120.0,
      //                     // height: 100.0,
      //                     child: RaisedButton(
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(18.0),
      //                           side: BorderSide(color: Colors.blue)),
      //                       onPressed: () {},
      //                       color: Colors.blue,
      //                       textColor: Colors.white,
      //                       child: Text("Salvar".toUpperCase(),
      //                           style: TextStyle(fontSize: 12)),
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      // ),
      // ),
    );
  }
}
