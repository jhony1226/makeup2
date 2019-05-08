import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:makeup2/componentes/horizontal.dart';
import 'package:makeup2/componentes/productos.dart';
import 'package:makeup2/models/Productos.dart';
import 'package:makeup2/paginas/carrito.dart';
import 'package:makeup2/paginas/compras.dart';
import 'package:makeup2/paginas/login_registro.dart';
import 'dart:convert';
import 'package:makeup2/paginas/detalle_producto.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:makeup2/prueba.dart';

class home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
  //{
  //return new homeState();
  //}
}

class HomeState extends State<home> {
  var list;
  int alto;
  List  data;
  Future <List<Productos>> geteData() async {
    var url = "http://192.168.1.55:8000/api/v1/productos";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      list = json.decode(response.body);
      data = list['productos'];

      @override
      void setState(fn) {
        // TODO: implement setState
        super.setState(fn);

        alto = data.length;
      }
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


  @override
  void initState() {
    super.initState();
    this.geteData();
  }

  var product_lis = [
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
    {
      "name": "AOA Perfect Polvo Compacto ORIGINAL",
      "picture": "assets/images/img2.jpg",
      "old_price": "23.345",
      "price": '9.000',
    },
    {
      "name": "AOA Perfect Polvo Compacto ORIGINAL",
      "picture": "assets/images/mascara.png",
      "old_price": "34.555",
      "price": '9.000',
    }
  ];

  @override
  Widget build(BuildContext context) {
    Widget imagen_Carrusel = new Container(
        height: 405.0,
        child: Carousel(
          boxFit: BoxFit.fill,
          //images: snapshot.data ,
          images: [
            AssetImage('assets/images/promo1.png'),
            AssetImage('assets/images/promo2.png'),
            AssetImage('assets/images/promo3.png'),
          ],
          autoplay: true,
          dotSize: 1.0,
          dotSpacing: 10.0,
          dotBgColor: Colors.black.withOpacity(0.3),
          showIndicator: true,
          indicatorBgPadding: 24,
          //dotColor: Colors.white.withOpacity(0.5),
          //        animationCurve: Curves.fastOutSlowIn,
          //        animationDuration: Duration(microseconds: 1000),
        ));

    return Scaffold(
        drawer: Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              new UserAccountsDrawerHeader(
                accountName: Text('Makeup',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.overline)),
                accountEmail: Text(
                  'El mejor maquillaje en un solo lugar !',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.overline),
                ),
                currentAccountPicture: GestureDetector(),
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/banner.png'),
                        fit: BoxFit.cover)),
              ),
              InkWell(
                child: ListTile(
                  title: Text('Menu Principal'),
                  leading: Icon(
                    Icons.home,
                    color: Color(0xFFce2276),
                  ),
                ),
              ),
              Divider(
                height: 10.0,
                color: Colors.pink,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new loginr()),
                  );
                },
                child: ListTile(
                  title: Text('Mi Cuenta'),
                  leading: Icon(Icons.person, color: Color(0xFFce2276)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Mis Compras'),
                  leading:
                      Icon(Icons.shopping_basket, color: Color(0xFFce2276)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new carrito()));
                },
                child: ListTile(
                  title: Text('Carrito'),
                  leading: Icon(Icons.shopping_cart, color: Color(0xFFce2276)),
                ),
              ),
              InkWell(
                child: ListTile(
                  title: Text('Favoritos'),
                  leading: Icon(Icons.favorite, color: Color(0xFFce2276)),
                ),
              ),
            ],
          ),
        ), //drawell

        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("MAKEUP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Container(height: 400, child: imagen_Carrusel),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {}),
                  new IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new carrito()));
                      })
                ],
              )
            ];
          },
//          body: ListView(controller: ScrollController(),
//            padding: EdgeInsets.only(top: 0),
//           scrollDirection: Axis.vertical,
//            children: <Widget>[
//            SizedBox(
//              height: 3.0,
//              child: new Center(
//                child: new Container(
//                  height: 6.0,
//                  color: Colors.grey[800],
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top:10 ,bottom: 8,left: 8),
//              child:Text("Categorias",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
//            ),
////
//              horizontal(),
//
//              Container(
//                height: MediaQuery.of(context).size.height,
//                child: Center(
//                    child:FutureBuilder<List<Productos>>(
//                        future: geteData(),
//                        builder: (context, snapshot) {
//                          if (snapshot.hasError) {
//                            return Center(
//                              child: Text(snapshot.error.toString()),
//                            );
//                          } else {
//                            //initState();
//                            List<Productos> p = snapshot.data;
//                              return GridView.builder( itemCount: snapshot.data.length,
//                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                      crossAxisCount: 2,
//                                      childAspectRatio: 0.8,
//                                      crossAxisSpacing: 0.5,
//                                      mainAxisSpacing: 1),
//                                  itemBuilder:(context,index){
//                                      return  Single_prod(
//                                          prod_price: 2,
//                                          prod_old_price: p[index].prod_name,
//                                          prod_pricture: "vv",
//                                          prod_name: p[index].prod_name,
//                                      );
//                                  });
//
////
//                          }
//                        }
//
//                    )
//                ),
//              )
//
//            ],
//
//          ),//body listVieww

//
            body: CustomScrollView(
              slivers: <Widget>[
                // scafoll
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 3.0,
                      child: new Center(
                        child: new Container(
                          height: 6.0,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    horizontal(),
                    new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text('Productos Recientes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ]),
                ),
                SliverGrid(delegate: SliverChildBuilderDelegate((contex,index){
                  return FutureBuilder<List<Productos>>(
                      future: geteData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Productos> p = snapshot.data;

                          for(Productos prod in p){
                            return Center(child: Text(prod.prod_name+'gngng'),);

                          };

//                              p.map((prod)=>
//                                  Single_prod(
//                                    prod_price: 2,
//                                    prod_old_price: prod.prod_name,
//                                    prod_pricture: "vv",
//                                    prod_name: prod.prod_name,
//                                  )).toList();
//
                        } else {

                          return Center(
                          child: Text(snapshot.error.toString()),
                        );


                        }
                      }

                  );

                },), gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),


              ],
            )//body Customscrollview


        ));
  }

}



class Single_prod extends StatelessWidget {
  final String prod_name;
  final String prod_pricture;
  final String prod_old_price;
  final int prod_price;
  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                  nombre_producto: 'g',
                                  imagens_producto: 'g',
                                  precio_antes: 'g',
                                  precio_nuevo: 'g',
                                  descripcion_producto: "holamindos",
                                ))),
                    child: GridTile(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Image.asset(
                            "assets/images/img2.png",
                            //   fit: BoxFit.cover,
                            height: 150, alignment: Alignment.topCenter,
                          )),
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
                                      text: "\$${'nombres'}",
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
                                    text: "\$${'prod'}",
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
            )));
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
