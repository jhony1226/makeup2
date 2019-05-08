import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makeup2/models/Productos.dart';
import 'package:makeup2/paginas/carrito.dart';
import 'package:makeup2/paginas/detalle_producto.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:makeup2/prueba.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var list;
  int alto;
  List data;
  Future<List<Productos>> geteData() async {
    var url = "http://192.168.1.55:8000/api/v1/productos";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      list = json.decode(response.body);
      data = list['productos'];
      alto = data.length;

      return data.map((producto) => Productos.fromJson(producto)).toList();
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

  var productos = [
    {
      "name":
          "Polvo Compacto Mineral J. Ca Polvo Compacto Mineral J. Catxfxzfgt",
      "picture": "assets/images/img1.png",
      "old_price": "19.000",
      "price": '9.000',
    },
    {
      "name": "AOA Perfect Polvo Compacto ORIGINAL",
      "picture": "assets/images/img2.png",
      "old_price": "1.234",
      "price": '9.000',
    },
  ];

  @override
  void initState() {
    super.initState();
    //this.geteData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 300,
      child:  Center(
        child: FutureBuilder<List<Productos>>(
                      future: geteData(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                         // return Container(child: Center(child: Text('njjjss'),));
                         List<Productos> p = snapshot.data;
                              return ListView(scrollDirection: Axis.vertical,children: p.map((prod)=>
                               Single_prod(prod_name: prod.prod_name,prod_pricture: prod.prod_pricture,
                               prod_old_price: 'mm',prod_price: '22', )).toList());

//
                            }
                        }

                    ),
      ),
    );

//      new StaggeredGridView.countBuilder(
//      crossAxisCount: 4,
//      controller: ScrollController(initialScrollOffset: 10),
//      itemCount: productos.length,
//      itemBuilder: (BuildContext context, int index) => new Single_prod(
//            prod_name: productos[index]['name'],
//            prod_pricture: "assets/images/img2.png",
//            prod_old_price: productos[index]['name'],
//            prod_price: productos[index]['name'],
//          ),
//      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 3),
//      mainAxisSpacing: 2.0,
//      crossAxisSpacing: 2.0,
//    );
//
//    return new Scaffold(
//        body: new FutureBuilder<List>(
//      builder: (context, snapshot) {
//        if (snapshot.hasError)
//          print(snapshot.error );
//        return snapshot.hasData
//            ? new Single_prod(
//            prod_name: "ffff",
//            prod_pricture: "assets/images/mascara.png",
//            prod_old_price: "ff",
//            prod_price: "ffff",
//        )
//            : new Center(
//                child: CircularProgressIndicator(),
//              );
//      },
//     // future: geteData(),
//    )
//    );
  }
}

//class Itemlist extends StatelessWidget {
//  final List lista;
//  Itemlist({this.lista});
//
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}

class Single_prod extends StatelessWidget {
  final String prod_name;
  final String prod_pricture;
  final String prod_old_price;
  final String prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.pink, width: 0.2, style: BorderStyle.solid),
            ),
            elevation: 4.0,
            child: Hero(
              tag: new Text('hero'),
              child: Material(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(15.0),
                  child: InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new detalle_producto(
                                  nombre_producto: prod_name,
                                  imagens_producto: prod_pricture,
                                  precio_antes: prod_old_price,
                                  precio_nuevo: prod_price,
                                  descripcion_producto: "holamindos",
                                ))),
                    child: GridTile(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Image.asset(
                            prod_pricture,
                            //   fit: BoxFit.cover,
                            height: 150, alignment: Alignment.topCenter,
                          )),
                          // Center(
//                            Padding(
//                              padding: EdgeInsets.only(
//                                  top: 5, left: 5, right: 5),
//
//                            ),
                          //),
                        ],
                      ),
                      footer: Container(
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white70),
                        color: Colors.white70,
                        child: Column(children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16, bottom: 5, top: 5, right: 16),
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  text: TextSpan(
                                    text: prod_name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, bottom: 10, top: 5),
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      text: "\$${prod_price}",
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    right: 16, bottom: 10, top: 5, left: 14),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "\$${prod_old_price}",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14.0),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          InkWell(
                            onTap: () => _showToast(context),
                            child: Container(
                              color: Colors.pink,
                              height: 30,
                              child: new Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55),
                                    child: Text(
                                      'AGREGAR',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ) //inkwell
                  ),
            )

//      child: Card(
//        elevation: 5.0,
//        child: Hero(
//            tag: new Text('tex1'),
//            child: Material(
//              child: InkWell(
//                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                    builder: (context) => new detalle_producto(
//                          nombre_producto: prod_name,
//                          imagens_producto: prod_pricture,
//                          precio_antes: prod_old_price,
//                          precio_nuevo: prod_price,
//                          descripcion_producto: "holamindos",
//                        ))),
//                child: GridTile(
//                  child:Column(
//                    children: <Widget>[
//                      Image.asset(
//                        prod_pricture,
//                        fit: BoxFit.cover,
//                      ),
//                      Image.asset(
//                        prod_pricture,
//                        fit: BoxFit.cover,
//                      ),
//                    ],
//                  ),
//                  footer: Container(
//                    color: Colors.white70,
//                    child: Column(
//                          children: <Widget>[
//                            new Row(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Padding(
//                                    padding: EdgeInsets.only(left: 2.0),
//                                    child: RichText(
//                                      softWrap: true,
//                                      text: TextSpan(
//                                        text: prod_name,
//                                        style: TextStyle(
//                                          fontSize: 15.0,
//                                          color: Colors.black,
//                                        ),
//
//                                      ),
//                                    ),
//                                  )
//                                )
//
//                              ],
//                            ),
//                            new Row(
//                              children: <Widget>[
//                                  Expanded(
//                                  child: Padding(
//                                      padding: EdgeInsets.only(left: 2.0),
//                                      child: RichText(
//                                        softWrap: true,
//                                        text: TextSpan(
//                                          text: "\$${prod_price}",
//                                          style: TextStyle(
//                                              color: Color(0xff757575),
//                                              fontWeight: FontWeight.w500,
//                                              fontSize: 20.0
//                                          ),
//
//                                        ),
//                                      ),
//                                    )
//                                ),
//
//                              ],
//                            ),
//
//
//
//                          ],
//
//
//                      ),
//                  ),
//
//                ),
//              ),
//            )),
//      ),
            ));
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('AGREGADO AL CARRITO'),
      action:
          SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
