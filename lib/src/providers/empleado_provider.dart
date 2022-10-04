import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lock_clock/src/models/empleado_model.dart';

class EmpleadosProvider {
  final String _url = 'https://flutter-570db-default-rtdb.firebaseio.com';

  Future<bool> crearEmpleado(EmpleadoModel empleado) async {
    final url = '$_url/empleados.json';

    final resp = await http.post(url, body: empleadoModelToJson(empleado));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarEmpleado(EmpleadoModel empleado) async {
    final url = '$_url/empleados/${empleado.id}.json';

    final resp = await http.put(url, body: empleadoModelToJson(empleado));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<EmpleadoModel>> cargarEmpleados() async {
    final url = '$_url/empleados.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<EmpleadoModel> empleados = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, empl) {
      final emplTemp = EmpleadoModel.fromJson(empl);
      emplTemp.id = id;

      empleados.add(emplTemp);
    });

    //print(empleados[0].id);

    return empleados;
  }

  Future<int> borrarEmpleado(String id) async {
    final url = '$_url/empleados/$id.json';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }
}
