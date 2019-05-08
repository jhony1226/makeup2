import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makeup2/paginas/login_registro.dart';
import 'package:http/http.dart'as http;

class login extends StatefulWidget {
  @override
  _loginState createState() => new _loginState();
}

class _loginState extends State<login> {
  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
        body:  new Stack(
          key: _formKey,
          children: <Widget>[
            new Image.asset(
              'assets/images/logo1.png',
              fit: BoxFit.cover,
            ),

            new Center(
              child: new Container(

                child: ListView(
                  children: <Widget>[ Padding(padding: EdgeInsets.only(top: 50)),
                    new Card(
                      color: Colors.white,
                      elevation: 3.0,
                      margin: EdgeInsets.only(right: 15.0, left: 15.0),
                      child: new Wrap(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 20,top: 20),
                                    child:  FloatingActionButton(
                                      backgroundColor: Colors.pink,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close, color: Colors.white,size: 20,),
                                    ),
                                )

                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: new Container(
                                child:  new Text('LOGIN',style: TextStyle(color:  Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 40.0,top: 0),
//                        child: Text(
//                          "Email",
//                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
//                        ),
//                      ),
                          //email
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: TextFormField(
                                    controller: controllerUsuario,
                                    validator: (value) {
                                      if (value.isEmpty) return "Ingresa un nombre de usurio";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 40.0,top: 10),
//                        child: Text(
//                          "Clave",
//                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
//                        ),
//                      ),
                          //contraseña
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: TextFormField(
                                    controller: controllerPassword,
                                    validator: (value) {
                                      if (value.isEmpty) return "Ingresa una Contraseña";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Contraseña',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

//                      new ListTile(
//
//                        leading: const Icon(Icons.person),
//                        title: new TextField(
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            hintText: 'Email',
//                            hintStyle: TextStyle(color: Colors.grey),
//                          ),
//                          keyboardType: TextInputType.emailAddress,
//                        ),
//
////                        TextFormField(
////                          decoration: new InputDecoration(
////                            hintText: 'Email',
////                            labelText: 'Email',
////                          ),
////                          keyboardType: TextInputType.emailAddress,style: TextStyle(color: Colors.pink),
////                        ),
//                      ),
//                      new ListTile(
//                        leading: const Icon(Icons.lock),
//                        title: new TextField(
//                          decoration: new InputDecoration(
//                            hintText: 'Clave',
//                            labelText: 'Clave',
//                          ),
//                          keyboardType: TextInputType.emailAddress,
//                          obscureText: true,
//                        ),
//                      ),
                          //olvido clave
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Olvidaste tu Clave",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black54,
                                      fontSize: 14.0),
                                ),
                              ),
                            ),
                          ),

                          //nuevousuario
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
                              child: InkWell(
                                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new loginr(),
                                )
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'Nuevo Usuario? ',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black54)),

                                      TextSpan(

                                          text: 'Registrate',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            decoration: TextDecoration.underline,
                                            color: Colors.black54,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
//                      Center(
//                        child: Padding(
//                          padding: const EdgeInsets.only(bottom: 20),
//                          child: new RaisedButton(
//                            onPressed: () {
//                              print('Login Pressed');
//                            },
//                            color: Colors.pink[100],
//                            shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0)),
//                            child: new Text('Login',
//                                style: new TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.bold)),
//                          ),
//                        ),
//                      ),

                          Container(
                            margin: const EdgeInsets.only(top: 5.0, bottom: 10),
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color:  Colors.pink,
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100.0),
                                          child: Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        new Expanded(
                                          child: Container(),
                                        ),
//                                    new Transform.translate(
//                                      offset: Offset(15.0, 0.0),
//                                      child: new Container(
//                                        padding: const EdgeInsets.all(5.0),
//                                        child: FlatButton(
//                                          shape: new RoundedRectangleBorder(
//                                              borderRadius:
//                                              new BorderRadius.circular(28.0)),
//                                          splashColor: Colors.white,
//                                          color: Colors.white,
//                                          child: Icon(
//                                            Icons.arrow_forward,
//                                            color: Colors.black54,
//                                          ),
//                                          onPressed: () => {},
//                                        ),
//                                      ),
//                                    )
                                      ],
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                       // addData();
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

//                          Container(
//                            margin: const EdgeInsets.only(bottom: 20),
//                            padding:
//                                const EdgeInsets.only(left: 20.0, right: 20.0),
//                            child: new Row(
//                              children: <Widget>[
//                                new Expanded(
//                                  child: RaisedButton(
//                                    shape: new RoundedRectangleBorder(
//                                        borderRadius:
//                                            new BorderRadius.circular(30.0)),
//                                    splashColor: Colors.black54,
//                                    color:  Colors.pink,
//                                    child: new Row(
//                                      children: <Widget>[
//                                        Padding(
//                                          padding:
//                                              const EdgeInsets.only(left: 90),
//                                          child: Image.asset(
//                                            'assets/images/google.png',
//                                            height: 30,
//                                            width: 20,
//                                          ),
//                                        ),
//
//                                        new Padding(
//                                          padding:
//                                              const EdgeInsets.only(left: 5.0),
//                                          child: Text(
//                                            "GOOGLE",
//                                            style: TextStyle(
//                                                color: Colors.white,
//                                                fontWeight: FontWeight.normal),
//                                          ),
//                                        ),
//
////                                    new Transform.translate(
////                                      offset: Offset(15.0, 0.0),
////                                      child: new Container(
////                                        padding: const EdgeInsets.all(5.0),
////                                        child: FlatButton(
////                                          shape: new RoundedRectangleBorder(
////                                              borderRadius:
////                                              new BorderRadius.circular(28.0)),
////                                          splashColor: Colors.white,
////                                          color: Colors.white,
////                                          child: Icon(
////                                            Icons.arrow_forward,
////                                            color: Colors.black54,
////                                          ),
////                                          onPressed: () => {},
////                                        ),
////                                      ),
////                                    )
//                                      ],
//                                    ),
//                                    onPressed: () => {},
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
                          //fin
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )



    )
    );
  }
}
