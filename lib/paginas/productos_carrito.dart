import 'package:flutter/material.dart';
import 'package:makeup2/paginas/detalle_producto.dart';

class productos_carrito extends StatefulWidget {
  @override
  _productos_carritoState createState() => new _productos_carritoState();
}

class _productos_carritoState extends State<productos_carrito> {
 // final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  var lista_productos =[
      {
       "id":"001" ,
      "name": "Polvo Compacto Mineral J. Ca ",
      "picture": "assets/images/img3.png",
      "old_price": "19.000",
      "price": '9.000',
    },
    {
      "id":"002" ,
    "name": "AOA Perfect Polvo Compacto ORIGINAL",
    "picture": "assets/images/img4.png",
    "old_price": "1234",
    "price": '9.000',
    },
    {
      "id":"003" ,
    "name": "Set de Brochas Tipo Cartuchera Presentación de Lujo",
    "picture": "assets/images/img1.png",
    "old_price": "23345",
    "price": '9.000',
    },
    {
      "id":"004" ,
    "name": "Polvo compacto MAC Studio Fix",
    "picture": "assets/images/img5.jpg",
    "old_price": "34555",
    "price": '9.000',
    },
    {
      "id":"005" ,
    "name": "Polvo Suelto Traslucido y polvo Banana Beauty Creations",
    "picture": "assets/images/img2.png",
    "old_price": "2455555",
    "price": '9.000',
    },
    {
      "id":"006" ,
    "name": "Polvo Compacto Banana KLEANCOLOR ORIGINAL",
    "picture": "assets/images/img2.png",
    "old_price": "3455",
    "price": '9.000',
    },


  ];


  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
        itemCount:lista_productos.length,
        itemBuilder: (context,index){
          final item = lista_productos[index][index];
          return Dismissible(
            key: Key(lista_productos[index]['id']),
            onDismissed: (direction) {
              String f = lista_productos[index]['name'];

              // Remueve el elemento de nuestro data source.
              setState(() {
                lista_productos.removeAt(index);
              });
              Scaffold
                  .of(context)
                  .showSnackBar(SnackBar(content: Text(f+"- ha sido eliminado")));
            },
            background: Container(color: Colors.red,child: Icon (Icons.delete_forever,color: Colors.white,size: 50,)),

            child: new producto_unit(
              name:lista_productos[index]["name"],
              picture: lista_productos[index]["picture"],
              old_price: lista_productos[index]["old_price"],
              price: lista_productos[index]["price"],
            ),
          );
    }

    );
  }
}
class producto_unit extends StatelessWidget {
  final name;
  final picture;
  final old_price;
  final price;

  producto_unit({
    this.name,
    this.picture,
    this.old_price,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () { },
      child: new Card(
        elevation:1,
          child: ListTile(
            //imagen producto
            leading: new Image.asset(picture,width: 80,height: 50,),
            //=========seccion de titulos=======
            title: new Text(name),
            subtitle: new Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
//                    Expanded(
//                        child: new Text('cantidad: 5')
//                    ),
                    new Container(
                      alignment: Alignment.topLeft,
                      child: new Text("\$${price}",
                        style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

//                    Padding(
//                      padding: const EdgeInsets.only(left: 130),
//                      child: new Container(
//                        alignment: Alignment.topLeft,
//                        child: Icon(Icons.delete,color: Colors.pink,)
//                      ),
//                    ),

                  ],
                ),

              ],
            ),

          )
      ),
    );


  }
}

