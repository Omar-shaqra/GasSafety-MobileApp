import 'package:flutter/material.dart';
import 'package:graduation/navbar.dart';
import 'package:graduation/login.dart';
//import 'contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'grade',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool swichsign;

  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/slider.png'), fit: BoxFit.cover),
          )),
          Positioned(
              child: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    swichsign = false;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return login(swichsign: swichsign);
                  }));
                },
                child: Text(
                  "login ",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20.0,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    swichsign = true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return login(swichsign: swichsign);
                  }));
                },
                child: Text(
                  "sign up",
                  style: TextStyle(fontSize: 20.0, color: Colors.teal),
                ),
              )
            ],
          ))
        ],
      ),
      drawer: navbar(),
      //appBar:
      //body: Body(),
    );
  }
}
