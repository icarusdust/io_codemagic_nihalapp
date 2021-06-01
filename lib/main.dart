import "package:flutter/material.dart";
import "./text.dart";
import "package:firebase_core/firebase_core.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _question = 0;
  // var _info = '';
  void _answerQuetions(){
    if (_question == 50){
      _question = -2;
    }
    setState(() {
      _question = _question + 2;
      // _info = '';
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     width:double.infinity,
      //     child:Text("Codemagic Nihal", textAlign:TextAlign.center),)
      // ),
        body: Container(
          width:double.infinity,
          decoration:BoxDecoration(
            image:DecorationImage(
                image:AssetImage("./assets/images/cm.png"),
                fit:BoxFit.fill
            ),
          ),
          child:Column(
            children: [
              Question('$_question'),
              Container(
                padding: EdgeInsets.all(100),
                child:Column(
                    children:[
                      FloatingActionButton(
                        onPressed: _answerQuetions,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                        backgroundColor: Colors.green,
                      ),
                      // ElevatedButton(child:Text("Decrement by 2"), onPressed: _decrement),
                    ]),
              )],
          ),
        )),);
  }
}