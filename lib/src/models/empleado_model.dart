// To parse this JSON data, do
//
//     final empleadoModel = empleadoModelFromJson(jsonString);

import 'dart:convert';

EmpleadoModel empleadoModelFromJson(String str) =>
    EmpleadoModel.fromJson(json.decode(str));

String empleadoModelToJson(EmpleadoModel data) => json.encode(data.toJson());

class EmpleadoModel {
  EmpleadoModel({
    this.id,
    this.nombre = '',
    this.apellidos = '',
    this.entrada = '10:00',
    this.salida = '23:00',
    this.fecha = 'dd-MM-yyyy',
  });

  String id;
  String nombre;
  String apellidos;
  String entrada;
  String salida;
  String fecha;

  factory EmpleadoModel.fromJson(Map<String, dynamic> json) => EmpleadoModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        entrada: json["entrada"],
        salida: json["salida"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "entrada": entrada,
        "salida": salida,
        "fecha": fecha,
      };
}
