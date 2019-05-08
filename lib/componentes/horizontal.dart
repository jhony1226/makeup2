import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makeup2/models/Productos.dart';
import 'package:makeup2/paginas/categorias.dart';
import 'package:http/http.dart' as http;

class horizontal extends StatefulWidget {

  @override
  horizontalState createState() {
    return new horizontalState();
  }
}

class horizontalState extends State<horizontal> {
var list;

int alto;

List  data;

Future <List<Categorias>> geteData() async {
  var url = "http://192.168.1.55:8000/api/v1/productos";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    list = json.decode(response.body);
    data = list['categorias'];
    alto = data.length;

    return data.map((producto) => Categorias.fromJson(producto)).toList();

  } else {
    throw Exception('falla en carga');
  }
  // });
  //   http:localhost/api/v1/productos
  //   http:localhost/api/v1/promociones
  //   http:localhost/api/v1/categorias
  // http://localhost/makeup/getdata.php?accion=productos_id&id=123
  //"http://192.168.0.15/tienda/getdata.php?accion=productos"
  //List img = this.imagens;
}

  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 100.0,
      color: Color(0xfff5f5f5),
      child: Center(
        child: FutureBuilder<List<Categorias>>(future: geteData(),
            builder: (context,snapshot){
           if (snapshot.data == null) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
             List<Categorias> p = snapshot.data;
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: p.map((prod)=>
                      categoria(
                          descipcion: prod.descripcion,
                          imagen_icon:'assets/images/cat5.png',
                          indice: prod.indice)).toList(),);

           }
        })
      ),
    );
  }
}

class Categorias {
  final String imagen_icon;
  final int indice;
  final String descripcion;

  Categorias({this.imagen_icon, this.indice,this.descripcion});

  factory Categorias.fromJson(Map<String, dynamic> parsedJson){
    return Categorias(
        imagen_icon: parsedJson['nombre'],
        indice: parsedJson['id'] as int,
        descripcion: parsedJson['nombre']
    );
  }
}

class categoria extends StatelessWidget {
  final String imagen_icon;
  final String descipcion;
  final int indice;

  categoria({this.imagen_icon, this.descipcion, this.indice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child:InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new categoria_list(),
          )
        ),
        child: Column(

          children: <Widget>[
            Stack(
                alignment: const Alignment(0, 0.9),

                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagen_icon),
                    backgroundColor: Color(0xfffce4ec),
                    radius: 35,
                  ),

                ],
              ),
            Container(

              decoration: BoxDecoration(
                //color: Colors.black38,
              ),
              child: Text(
                descipcion,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),

          ],

        ),
      )

    );
  }
}
