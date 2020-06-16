import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Commons {
  static getIPExtern() async {
    // external network ip
    var ipRegexp = RegExp(
        r'((?:(?:25[0-5]|2[0-4]\d|(?:1\d{2}|[1-9]?\d))\.){3}(?:25[0-5]|2[0-4]\d|(?:1\d{2}|[1-9]?\d)))');
    var url = 'http://www.ip.cn/';
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse(url));
    var reponse = await request.close();
    reponse.transform(utf8.decoder).forEach((line) {
      ipRegexp.allMatches(line).forEach((match) {
        print(match.group(0));
      });
    });
  }

  static getIP() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        // print('${addr.address}');
        return addr.address;
      }
    }
  }
}

Widget _exit(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      // Navigator.of(context).pop();
      //  Navigator.pushReplacementNamed(context, '/home-page');

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => null)); //new CursosPage()));
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Sim"),
    onPressed: () {
      SystemNavigator.pop();
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmação"),
    content: Text("Confirma a saída ?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
