class Productos{
  final  String prod_name;
  final  String prod_pricture;
  final  int prod_old_price;
  final  String  prod_price;


  Productos({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,

  });



  factory Productos.fromJson(Map<String, dynamic> parsedJson){
    return Productos(
      prod_name: parsedJson['nombre'] ,
      prod_old_price: parsedJson['precio_normal'],
      prod_price: "gg",
      prod_pricture:"assets/images/img2.png"
    );


  }
}

//class Imagen {
//  final id;
//  final nombre;
//  final productoId;
//
//  Imagen({this.id, this.nombre, this.productoId, });
//
//  factory Imagen.fromJson(Map<String, dynamic> json){
//    return Imagen(
//        id: json['id'],
//        productoId: json['nombre'],
//        nombre: "assets/images/img2.png",
//
//    );
//  }
//}