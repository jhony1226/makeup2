import 'package:flutter/material.dart';
import 'package:makeup2/login.dart';
import 'package:makeup2/paginas/productos_carrito.dart';

class compras extends StatefulWidget {
  @override
  _carritoState createState() => new _carritoState();
}

class _carritoState extends State<compras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Mis Compras',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),  onPressed:(){}
          )
        ],
      ),
      body: new productos_carrito(),


//        child: Row(
//          children: <Widget>[
//            Expanded(
//                child: ListTile(
//                  title: new Text('Total:'),
//                  subtitle: new Text("\$53.000"),
//                ),
//            ),
//            Expanded(
//                child: new MaterialButton(
//                    onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
//                      builder: (context) => new login() ,
//                    )
//                    ),
//                    elevation: 5.0,
//
//                  child: new Text("Pagar",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//                  color:Colors.pink
//                ))
//          ],
//        ),

    );
  }
}
