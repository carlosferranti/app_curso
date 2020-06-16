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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);



//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
       
//         title: Text(widget.title),
//       ),
//       body: Center(
       
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
          
//           ],
//         ),
//       ),

//     );
//   }
// }
