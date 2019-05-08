import 'dart:async';

import 'dart:convert';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

var routes = <String, WidgetBuilder>{
  "/intro": (BuildContext context) => home(),
};

void main() => runApp(
    MaterialApp(
    theme:ThemeData(
        buttonColor: Colors.white,
        bottomAppBarColor: Colors.white,
        backgroundColor: Colors.pink,
        dividerColor: Colors.pink,
        primaryColorDark: Colors.white,
        primaryColor: Colors.pink,//color de appbar
        accentColor: Colors.pink[200],//scroll
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
    ),

    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes
    ));

class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() =>Navigator.of(context).pushNamedAndRemoveUntil('/intro', (Route<dynamic> route) => false));
        //Navigator.pushNamed(context,"/intro"));
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
            //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/fondo.png"))),
            child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                 //   Container(
                 Image.asset('assets/images/fondo.png',fit: BoxFit.cover,),
                   // ),
                    Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            Image.asset('assets/images/logo.png',height: 150.0,),
                                            Padding(
                                                padding: EdgeInsets.only(top: 2.0),
                                            ),
                                            Text(
                                                'MakeUp',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24.0),
                                            ),
                                            Text(
                                                'PREMIUM',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0),
                                            )
                                        ],
                                    ),
                                ),
                            ),
                            Expanded(
                               // flex: 1,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                        CircularProgressIndicator(
                                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 60.0),
                                        ),
                                        Text(
                                            'Bienvenidos',
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                                color: Colors.white),
                                        )
                                    ],
                                ),
                            )
                        ],
                    )
                ],
            ),
          ),
      );
  }

  home() {}


}




