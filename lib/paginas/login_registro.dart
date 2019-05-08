import 'package:flutter/material.dart';
import 'package:makeup2/home.dart';
import 'package:http/http.dart'as http;

class loginr extends StatefulWidget {
  @override
  _loginState createState() => new _loginState();
}

class _loginState extends State<loginr> {
  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerWasap = new TextEditingController();

  var _formKey = GlobalKey<FormState>();
  void addData() {
    var url = "http://192.168.0.15/tienda/adddata.php";

    http.post(url, body: {
      "nombre": "ccc",
      "contraseña":"1234",
      "apellido":"11111",
      "correo":"fdfdfdf"

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
        body: new Stack(
          key: _formKey,
              children: <Widget>[
                new Image.asset(
                  'assets/images/logo1.png',
                  fit: BoxFit.cover,
                ),

                new Center(
                  child: new Container(
                    child: ListView(
                      children: <Widget>[ Padding(padding: EdgeInsets.only(top:50)),
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
                                  child: new Text('REGISTRO',style: TextStyle(color: Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
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
                                      Icons.person,
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
                                  Form(
                                    child: new Expanded(
                                      child: TextFormField(
                                        controller: controllerUsuario,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Nombre ',
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

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
                                  Form(
                                    child: new Expanded(
                                      child: TextFormField(
                                        controller: controllerEmail,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Email',
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                  Form(
                                    child: new Expanded(
                                      child: TextFormField(
                                        controller: controllerPassword,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Contraseña',
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                      Icons.call,
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
                                  Form(
                                    child: new Expanded(
                                      child: TextFormField(
                                          controller: controllerWasap,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'WhatsApp',
                                          hintStyle: TextStyle(color: Colors.grey,),

                                        ),
                                          keyboardType: TextInputType.number
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),


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
                                      color: Colors.pink,
                                      child: new Row(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100.0),
                                            child: Text(
                                              "GUARDAR",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          new Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                      onPressed: ()  {
                                        addData();
                                          Navigator.pop(context);

                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ],
            )
    ));
  }
}