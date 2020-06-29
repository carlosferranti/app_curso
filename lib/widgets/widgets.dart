import 'package:app_curso/helper/data.dart';
import 'package:app_curso/models/article_model.dart';
import 'package:app_curso/models/category_model.dart';
import 'package:app_curso/views/adm_view.dart';
import 'package:app_curso/views/home.dart';
import 'package:app_curso/views/uploads_list_view.dart';
import 'package:app_curso/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:app_curso/commons/constants.dart' as Constants;
import 'dart:io';

class CircleIconButton extends StatelessWidget {
  // --

  final double size;
  final Function onPressed;
  final IconData icon;

  CircleIconButton({this.size = 30.0, this.icon = Icons.clear, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPressed,
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment(0.0, 0.0), // all centered
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                ),
                Icon(
                  icon,
                  size: size * 0.6, // 60% width for icon
                )
              ],
            )));
  }
}

Widget buildDrawer(BuildContext context) {
  //
  try {
    return Drawer(
      child: Container(
        color: Colors.white24,
        child: ListView(
          children: <Widget>[
            // -- Menu Drawer - Cabecalho
            // --
            //  new Container(child: new DrawerHeader(child: new CircleAvatar()),color: Colors.tealAccent,),
            new UserAccountsDrawerHeader(
              //accountName: new Text('Carlos'),
              accountName: new Text(
                'Curso Aprovação',
                style: TextStyle(
                  color: Colors.white70,
                  //decoration: TextDecoration.underline,
                  // decorationColor: Colors.red,
                  // decorationStyle: TextDecorationStyle.wavy,
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Open Sans',
                  //height: 40.0,
                ),
              ),
              // accountEmail: new Text('cursoaprovacao@cursoaprovacao.com.br.'.toLowerCase(),
              accountEmail: new Text(
                Constants.usuarioEmail.toLowerCase() ?? 'Seja Bem-vindo',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              decoration: new BoxDecoration(
                color: Colors.red[300],
                image: new DecorationImage(
                  // image: new ExactAssetImage('assets/images/background_new.png'),
                  // image: AssetImage('assets/images/background_new.png'),
                  image: AssetImage('assets/images/background_new.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: new CircleAvatar(
                radius: 20,
                // child: new Container(
                //   padding: const EdgeInsets.all(0.0),
                //   child: new Text('Email'),
                // ),

                // backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
                backgroundImage: AssetImage('assets/images/aprovacao3.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            //
            // -- menu Drawer - Itens

            new ListTile(
              leading: new Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              title: new Text("Home"),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).pushNamed('/home-page');
                // --
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new Home(),
                    ));
                //
                //  Navigator.pushNamed(context, '/second');
                // Navigator.of(context).pushNamed('/settings');
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.view_headline,
                color: Colors.teal,
              ),
              title: new Text("Últimas notícias"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => null, //new NewsPage(),
                  ),
                );
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.account_balance,
                color: Colors.orange,
              ),
              title: new Text("Concursos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => new ConcursosPage(),
                    builder: (context) => null,
                  ),
                );
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.school,
                color: Colors.brown,
              ),
              title: new Text("Cursos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => new CursosPage(),
                    builder: (context) => null,
                  ),
                );
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.favorite,
                color: Colors.indigo,
              ),
              title: new Text("Meus favoritos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => new CursosPage(),
                    builder: (context) => null,
                  ),
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              leading: new Icon(
                Icons.account_circle,
                color: Colors.purple,
              ),
              title: new Text("Meu perfil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => null, //new CadastroUsuarioPage(),
                  ),
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              leading: new Icon(
                // Icons.power_settings_new,
                // Icons.block
                //Icons.cancel,
                Icons.close,
                color: Colors.red,
              ),
              title: new Text("Sair"),
              // onTap: () => SystemNavigator.pop(),
              // onTap: () => Navigator.of(context).pop,
              // onTap: () => Navigator.pop(context, 1),
              // onTap: () => exit(0),
              onTap: () {
                _confirmedExit(context);
              },
              // onTap: () =>Navigator.pop(context, 1), // CANCEL
            ),
            SizedBox(height: 15.0),
            new ListTile(
              // leading:
              title: new Text(
                "Ver. 0.8.0",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // onTap: () {
              // _exit(context);
              // SystemNavigator.pop();
              // },
            ),
          ],
        ),
      ),
    );
  } catch (e) {
    print('???????? == >> ' + e.toString());
  }
}

var items = [
  {'name': 'Configurações', 'value': 0},
  // {'name': 'Administração', 'value': 1},
  // {'name': 'Google.com', 'value': 2}
];

Widget builAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
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
            fontSize: 12,
            color: Colors.deepPurple,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      new Container(
        // alignment: Alignment.bottomLeft,
        // margin: EdgeInsets.only(top: 20.0, right: 10.0),
        child: IconButton(
          icon: Icon(Icons.settings,
              // size: 24,
              color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          ),
        ),
      ),
      // --
      // PopupMenuButton(
      //     onSelected: (x) {
      //       switch (x) {
      //         case 0:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Settings()),
      //           );
      //           break;
      //         case 1:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Adm()),
      //           );
      //           break;
      //       }
      //     },
      //     // icon: Icon(Icons.more_vert),
      //     icon: Icon(Icons.settings),
      //     itemBuilder: (context) => items
      //         .map<PopupMenuItem>((element) => PopupMenuItem(
      //               child: Text(element['name']),
      //               value: element['value'],
      //             ))
      //         .toList())
    ],
  );
}

_confirmedExit(BuildContext context) {
  //
  return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Confirmação'),
          content: new Text('Confirma a saída?'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              // child: Text("Não"),
              child: roundedButton(
                  "Não", const Color(0xFF167F67), const Color(0xFFFFFFFF)),
            ),
            SizedBox(height: 16),
            new GestureDetector(
                // child: Text("Sim"),
                child: roundedButton(
                    "Sim", const Color(0xFF167F67), const Color(0xFFFFFFFF)),
                // onTap: () => Navigator.of(context).pop(true),
                onTap: () {
                  // Navigator.of(context).pop(true);
                  // SystemNavigator.pop(); // apenas para Android
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop'); // Android e IOS
                  if (Platform.isAndroid) {
                    exit(0);
                    // Navigator.of(context).pop(true);
                  } else if (Platform.isIOS) {
                    // iOS-specific code
                  }
                }),
          ],
        ),
      ) ??
      false;
}

Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
  var loginBtn = new Container(
    padding: EdgeInsets.all(5.0),
    alignment: FractionalOffset.center,
    decoration: new BoxDecoration(
      color: bgColor,
      borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xFF696969),
          offset: Offset(1.0, 6.0),
          blurRadius: 0.001,
        ),
      ],
    ),
    child: Text(
      buttonLabel,
      style: new TextStyle(
          color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
  return loginBtn;
}
