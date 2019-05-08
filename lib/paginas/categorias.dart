import 'package:flutter/material.dart';
import 'package:makeup2/componentes/subcategorias_list.dart';

class categoria_list extends StatefulWidget {
  @override
  _categoria_listState createState() => new _categoria_listState();
}

class _categoria_listState extends State<categoria_list> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Ojos',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: <Widget>[

        ],
      ),
      body: new subcategoria_list()
    );
  }
}
