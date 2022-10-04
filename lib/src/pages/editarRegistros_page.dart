import 'package:flutter/material.dart';
import 'package:lock_clock/src/models/empleado_model.dart';
import 'package:lock_clock/src/providers/empleado_provider.dart';

class EditarRegistroPage extends StatefulWidget {
  @override
  _EditarRegistroPageState createState() => _EditarRegistroPageState();
}

class _EditarRegistroPageState extends State<EditarRegistroPage> {
  final empleadosProvider = new EmpleadosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(163, 228, 215, 0.5),
      appBar: AppBar(
        title: Text('Lista de Empleados'),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: _crearListado(),
      //floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: empleadosProvider.cargarEmpleados(),
      builder:
          (BuildContext context, AsyncSnapshot<List<EmpleadoModel>> snapshot) {
        if (snapshot.hasData) {
          final empleados = snapshot.data;

          return ListView.builder(
            itemCount: empleados.length,
            itemBuilder: (context, i) => _crearItem(context, empleados[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, EmpleadoModel empleado) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        empleadosProvider.borrarEmpleado(empleado.id);
      },
      child: ListTile(
        title: Text(
          '${empleado.nombre}',
          style: TextStyle(fontSize: 22.0, color: Colors.blueAccent),
        ),
        subtitle: Text('${empleado.apellidos}',
            style: TextStyle(fontSize: 16.0, color: Colors.black)),
        onTap: () =>
            Navigator.pushNamed(context, 'producto', arguments: empleado),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.black26,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
