import 'package:flutter/material.dart';
import 'package:makeup2/paginas/detalle_producto.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class GridViewExample extends StatefulWidget {
  @override
  _GridViewExampleState createState() => new _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {

  var product_list = [
  {
  "name": "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catt",
  "picture": "assets/images/img1.png",
  "old_price": "19.000",
  "price": '9.000',
},
  {
    "name": "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catt",
    "picture": "assets/images/ps.png",
    "old_price": "19.000",
    "price": '9.000',
  },
  {
    "name": "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catt",
    "picture": "assets/images/ps.png",
    "old_price": "19.000",
    "price": '9.000',
  },
  {
    "name": "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catt",
    "picture": "assets/images/ps.png",
    "old_price": "19.000",
    "price": '9.000',
  },
  {
    "name": "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catt",
    "picture": "assets/images/ps.png",
    "old_price": "19.000",
    "price": '9.000',
  },

  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount:4,
            itemCount: product_list.length,
         itemBuilder: (
             BuildContext context, int index) =>
             new producto_card(
               prod_name: product_list[index]['name'],
               prod_pricture: product_list[index]['picture'],
               prod_old_price: product_list[index]['old_price'],
               prod_price: product_list[index]['price'],
             ),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, 3),
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
        ),
      ),

    );
  }
}
class producto_card extends StatelessWidget {

  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  producto_card({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Card(
      elevation: 3.0,
      child: Hero(
          tag: new Text('tex1'),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new detalle_producto(
                    nombre_producto: prod_name,
                    imagens_producto: prod_pricture,
                    precio_antes: prod_old_price,
                    precio_nuevo: prod_price,
                    descripcion_producto: "holamindos",
                  ))),
              child: GridTile(
                child:Column(
                  children: <Widget>[
                    Image.asset(
                      prod_pricture,height: 200,width: 200,
                      fit: BoxFit.cover,
                    ),

                  ],
                ),
                footer: Container(
                  color: Colors.white70,
                  child: Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: prod_name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),

                                  ),
                                ),
                              )
                          )

                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "\$${prod_price}",
                                    style: TextStyle(
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0
                                    ),

                                  ),
                                ),
                              )
                          ),

                        ],
                      ),



                    ],


                  ),
                ),

              ),
            ),
          )),
    )

          );


  }
}

