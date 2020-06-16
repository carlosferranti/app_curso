import 'package:app_curso/views/home.dart';
import 'package:flutter/material.dart';
import 'package:app_curso/commons/constants.dart' as Constants;
import 'dart:io';

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
                color: Colors.white54,
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
              child: new Container(
                padding: const EdgeInsets.all(0.0),
                child: new Text('Email'),
              ),

              // backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
              // backgroundImage: AssetImage('assets/images/aprovacao3.png'),
              backgroundColor: Colors.transparent,
            ),
          ),

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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => new Home(),
              //     ));
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
          // new Divider(
          //   color: Colors.black,
          //   height: 5.0,
          // ),

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
    print('???????? == >> '+ e.toString());
  }
 
}

Widget builAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
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
    actions: <Widget>[
      PopupMenuButton<String>(
          onSelected: choiceAction(context, null),
          itemBuilder: (BuildContext context) {
            return Constantes.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          }),
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

class Constantes {
  static const String Configuracoes = 'Configurações';
  // static const String Settings = 'Configurações';

  static const List<String> choices = <String>[Configuracoes];
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  const Choice(title: 'Configurações', icon: Icons.settings),
  const Choice(title: 'Sair', icon: Icons.exit_to_app),
  const Choice(title: 'Home', icon: Icons.home),
];

choiceAction(BuildContext context, String value) {
  if (value == Constantes.Configuracoes) {
    // print('Configurações');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new Home(),
        ));
  }
}
