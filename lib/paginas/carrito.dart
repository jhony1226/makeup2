import 'package:flutter/material.dart';
import 'package:makeup2/login.dart';
import 'package:makeup2/paginas/productos_carrito.dart';

class carrito extends StatefulWidget {
  @override
  _carritoState createState() => new _carritoState();
}

class _carritoState extends State<carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Mi Carrito',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),  onPressed:(){}
          )
        ],
      ),
      body: new productos_carrito(),
      bottomNavigationBar: new Container(
        color:Colors.pink[50],

        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40,),
                  child: ListTile(
                    title: new Text('Total:',style: TextStyle(fontSize: 20),),
                    subtitle: new Text("\$53.000",style: TextStyle(fontSize: 18,color: Colors.pink),),
                  ),
                ),
            ),
            Expanded(
                child: new MaterialButton(
                    onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new login() ,
                    )
                    ),
                    elevation: 5.0,

                  child: new Text("Pagar",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  color:Colors.pink
                ))
          ],
        ),
      ),
    );
  }
}
