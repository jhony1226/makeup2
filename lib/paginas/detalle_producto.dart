import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:makeup2/home.dart';
import 'package:makeup2/paginas/carrito.dart';

class detalle_producto extends StatefulWidget {
  final nombre_producto;
  final imagens_producto;
  final descripcion_producto;
  final precio_antes;
  final precio_nuevo;

  detalle_producto(
      {this.nombre_producto,
      this.imagens_producto,
      this.descripcion_producto,
      this.precio_antes,
      this.precio_nuevo});
  @override
  _detalle_productoState createState() => new _detalle_productoState();
}

class _detalle_productoState extends State<detalle_producto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 8.1,
        iconTheme: IconThemeData(color: Colors.white),
        title: InkWell(
            onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>new home()));},
            child: Text("productos", style: new TextStyle(color: Colors.white))),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>new carrito()));})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          Hero(
            tag:'hero',
            child: new Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                    height: 200.0,
                    child: Carousel(

                      boxFit: BoxFit.cover,
                      images: [
                        AssetImage('assets/images/img1.png'),
                        AssetImage('assets/images/img2.png'),
                        AssetImage('assets/images/img3.png'),
                      ],
                      autoplay: false,
                      indicatorBgPadding: 5.0,
                      dotColor: Colors.white,
                      animationCurve: Curves.fastOutSlowIn,

                    )),
                header: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.nombre_producto,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ), //cotainer
              ),
            ),
          ),
          new SizedBox(
            height: 3.0,

            child: new Center(
              child: new Container(
                height: 6.0,
                color: Colors.pink[100],

              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10.0),
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: 'Descripcion:',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[700],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'AOA Perfect Pressed powder es como el nombre. UN TERCIOPELO,'
                              ' polvo blando finamente molida que puede usar para:'
                              ' configurar su maquillaje, iluminar, contorno, desenfocar los poros y más.',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ))
            ],
          ), //row_descripcion

          new SizedBox(
            height: 3.0,

            child: new Center(
              child: new Container(
                height: 6.0,
                color: Colors.pink[100],

              ),
            ),
          ),


          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10,bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Cantidad:",
                        style:
                        TextStyle(fontSize: 13.0,color: Color(0xFFce2276), fontWeight: FontWeight.bold)
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 40,
                        height: 30,
                        child: RaisedButton(
                          elevation: 2,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: (){
                            cantUP();
                          },
                        ),
                      ),
                    ),

                    Text("$cont",
                        style:
                        TextStyle(fontSize: 13.0,color: Color(0xFFce2276), fontWeight: FontWeight.bold)
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 40,
                        height: 30,
                        child: RaisedButton(
                          elevation: 2,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: (){
                            cantDOW();
                          },
                        ),
                      ),
                    ),

                  ],
                ),

              ),

            ],
          ),
          //==============
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
                Text("Precio:",
                    style:
                        TextStyle(fontSize: 13.0,color: Color(0xFFce2276), fontWeight: FontWeight.bold)
                ),

              ],
            ),

          ),
          Padding(
          padding: EdgeInsets.only(left: 10.0,top: 1.0),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(),
                    child: new Text("\$"+widget.precio_antes,
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration:TextDecoration.lineThrough
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new Text("\$"+widget.precio_nuevo,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))
                ),
              ],
            ),

          ),
          Divider(height: 10.0,color: Colors.pink,),
          Row(
            children: <Widget>[

              Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.pink,
                    textColor: Colors.black,
                    elevation: 2.0,
                    child: Text("COMPRA YA"),
                    
                  ),
              ),
              new IconButton(icon: Icon(Icons.favorite_border,color: Colors.pink,), onPressed: null),
              new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.pink), onPressed: null),
            ],
          ),


        ],
      ),
    );
  }
  int cont =0;
  void cantUP() {
    setState(()=>cont++);
  }
  void cantDOW() {
    if(cont>0){
      setState(()=>cont--);
    }

  }
  //clase para agregar al carrito


}


