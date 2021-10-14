import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key key}) : super(key : key);
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  TextEditingController _newWord = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: Text("First android flutter app"),
     ),
     body:Center(
           child: Form(
             key: _key,
             child: Column(
              children: <Widget>[
                SizedBox(
                  width: 300.0,
                    child: TextFormField(
                      controller: _newWord,
                      decoration: InputDecoration(
                        hintText: "Word",
                  ),
                      validator: (value){
                        if(value.isEmpty){
                          return "Must not be empty";
                        } else if(value.length < 3)  {
                          return "Must have more that 3 characters";
                        }
                        return null;
                      },
                )
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 300.0,
                  child: TextButton(
                    child:Text("Show Word", style: TextStyle(
                      color: Colors.white
                    ),),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: (){
                      if(!_key.currentState.validate()){
                        return;
                      }
                      final snackBar = SnackBar(
                        content: Text(_newWord.text, style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold
                        ),),
                        action: SnackBarAction(
                          label: "Nice !",
                          onPressed: (){},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                )
              ],
             )
           ),
     ),
   );
  }
}