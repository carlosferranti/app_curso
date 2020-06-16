// library Constants;
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter/material.dart';

const APPTITLE = "Curso Aprovação";
const ULTIMAS_NOTICIAS_TITLE = "Últimas notícias";
const AREA_TRIBUNAIS_TITLE = "Tribunais";
const AREAS_TITLE = "Áreas";
const DETALHES_DO_CURSO_TITLE = "Detalhes";
const CURSOS_TITLE = "Cursos";
const CONCURSOS_TITLE = "Concursos";
const PATH_IMAGE = "assets/images/";
const Color APPCOLOR = Color.fromRGBO(58, 66, 86, 1.0);
const SHOWALERTDIALOG_TITLE = "ATENÇÂO";
const SHOWERRORDIALOG_TITLE = "ERRO";
const SHOWWARNINGDIALOG_TITLE = "AVISO";
//
const String BOTTOM_CLOSE = "Fechar";

bool isLoggedIn = false;
bool remember = false;
String usuarioNome = "";
String usuarioEmail = "";
String ipDbConnection = '';
// String ipDbConnection =  (WifiIp.getWifiIp) as String;

final themeColor = Color(0xfff5a623);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);

// CircularProgressIndicator

// CircularProgressIndicatorCustom() {
//   return (
//     SpinKitCircle(
//     itemBuilder: (_, int index) {
//       return DecoratedBox(
//         decoration:
//             BoxDecoration(color: index.isEven ? Colors.red : Colors.green),
//       );
//     },
//   )
//   );
// }

// const appTitle = "Aprovação";
//  const  appConnDataServer = "Aprovação";

// enum Environment { DEV, STAGING, PROD }

// class Constants {
//   static Map<String, dynamic> _config;

//   static void setEnvironment(Environment env) {
//     switch (env) {
//       case Environment.DEV:
//         _config = _Config.debugConstants;
//         break;
//       case Environment.STAGING:
//         _config = _Config.qaConstants;
//         break;
//       case Environment.PROD:
//         _config = _Config.prodConstants;
//         break;
//     }
//   }

//   static get CONNECTSTRING {
//     return _config[_Config.CONNECTSTRING];
//   }
//   static get SERVER_ONE {
//     return _config[_Config.SERVER_ONE];
//   }

//   static get SERVER_TWO {
//     return _config[_Config.SERVER_TWO];
//   }

//   static get WHERE_AM_I {
//     return _config[_Config.WHERE_AM_I];
//   }
// }

// class _Config {
//   static const  CONNECTSTRING = "CONNECTSTRING";
//   //
//   static const SERVER_ONE = "SERVER_ONE";
//   static const SERVER_TWO = "SERVER_TWO";
//   static const WHERE_AM_I = "WHERE_AM_I";

//   static Map<String, dynamic> debugConstants = {
//     CONNECTSTRING : "http://192.168.100.3/aprovacao/",
//     SERVER_ONE: "localhost:3000/",
//     SERVER_TWO: "localhost:8080/",
//     WHERE_AM_I: "local",
//   };

//   static Map<String, dynamic> qaConstants = {
//     SERVER_ONE: "https://staging1.example.com/",
//     SERVER_TWO: "https://staging2.example.com/",
//     WHERE_AM_I: "staging",
//   };

//   static Map<String, dynamic> prodConstants = {
//     SERVER_ONE: "https://itsallwidgets.com/",
//     SERVER_TWO: "https://flutter.io/",
//     WHERE_AM_I: "prod"
//   };
// }
