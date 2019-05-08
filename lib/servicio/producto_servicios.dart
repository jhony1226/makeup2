import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:makeup2/servicio/producto_servicios.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';
import 'package:makeup2/models/Productos.dart';

    Future<String> getProductos() async {
      return await rootBundle.loadString('assets/student.json');
    }