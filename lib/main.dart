import 'package:app_curso/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Curso Aprovação',
      theme: ThemeData(
       
        // primarySwatch: Colors.blue,
          primaryColor: Colors.white,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Home(),  
    );
  }
} 

