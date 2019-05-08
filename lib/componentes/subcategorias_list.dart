import 'package:flutter/material.dart';
import 'package:makeup2/paginas/detalle_producto.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class subcategoria_list extends StatefulWidget {
  @override
  _subcategoria_listState createState() => new _subcategoria_listState();
}

class _subcategoria_listState extends State<subcategoria_list> {
  var lista_productos = [
    {
      "name":  'Mascara',
      "picture": "assets/images/etiqueta.png",
      "id":"01"
    },
    {
      "name": "Delineador",
      "picture": "assets/images/etiqueta.png",
      "id":"02"
    },
    {
      "name": "Sombras",
      "picture": "assets/images/etiqueta.png",
      "id":"03"
    },
    {
      "name": "Cejas",
      "picture": "assets/images/etiqueta.png",
      "id":"04"
    },
   ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount:lista_productos.length,
        itemBuilder: (context,index){
          return new producto_unit(
            name:lista_productos[index]["name"],
            picture: lista_productos[index]["picture"],

          );
        });
  }
}
class producto_unit extends StatelessWidget {
  final name;
  final picture;


  producto_unit({
    this.name,
    this.picture,

  });
  @override
  Widget build(BuildContext context) {
    return Container(

           child: Padding(
             padding: const EdgeInsets.only(top: 30,left: 16),
             child: Row(
               children: <Widget>[
                 Card(
                   child: Column(
                     children: <Widget>[
                       Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.favorite,color: Colors.pink,),
                        // child: Image.asset(picture,height: 20,width: 30,),
                       ),
                       Text(name),
                     ],
                   ),
                 ),



               ],
             ),
           ),

         );



  }
}