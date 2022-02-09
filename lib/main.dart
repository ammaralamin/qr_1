import 'package:flutter/material.dart';
import 'package:qr_code/screen/generator_qr.dart';
import 'package:qr_code/screen/read_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.purple,
        secondaryHeaderColor: Colors.deepPurpleAccent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
        @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("RQ qude"),
      ),
     body:(
     Center(
       child: Column(
         children: [
           ElevatedButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReadScreen()));
           },
               child: Text('Read QR')),
           ElevatedButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateScreen()));
           },
               child: Text('Creat QR ')),
         ],
       ),
     )
     ) ,
     );
  }
}
