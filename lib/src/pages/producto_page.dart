import 'package:flutter/material.dart';
import 'package:lock_clock/src/models/empleado_model.dart';
import 'package:lock_clock/src/providers/empleado_provider.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final empleadoProvider = new EmpleadosProvider();

  EmpleadoModel empleado = new EmpleadoModel();
  bool _guardando = false;

  @override
  Widget build(BuildContext context) {
    final EmpleadoModel empleaData = ModalRoute.of(context).settings.arguments;
    if (empleaData != null) {
      empleado = empleaData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Editar Empleado'),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearApellidos(),
                _crearEntrada(),
                _crearSalida(),
                _crearFecha(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: empleado.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      onSaved: (value) => empleado.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del empleado';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearApellidos() {
    return TextFormField(
      initialValue: empleado.apellidos,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Apellidos',
      ),
      onSaved: (value) => empleado.apellidos = value,
      validator: (value) {
        if (value.length < 6) {
          return 'Ingrese los apellidos del empleados';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearEntrada() {
    return TextFormField(
      initialValue: empleado.entrada,
      keyboardType: TextInputType.numberWithOptions(signed: true),
      decoration: InputDecoration(
        labelText: 'Hora de Entrada',
      ),
      onSaved: (value) => empleado.entrada = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Formato de fecha';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearSalida() {
    return TextFormField(
      initialValue: empleado.salida,
      keyboardType: TextInputType.numberWithOptions(signed: true),
      decoration: InputDecoration(
        labelText: 'Hora de Salida',
      ),
      onSaved: (value) => empleado.salida = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Formato de fecha';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearFecha() {
    return TextFormField(
      initialValue: empleado.fecha,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelText: 'Fecha',
      ),
      onSaved: (value) => empleado.fecha = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Formato de fecha';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.black26,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (empleado.id == null) {
      empleadoProvider.crearEmpleado(empleado);
    } else {
      empleadoProvider.editarEmpleado(empleado);
    }

    //setState(() { _guardando = false; });
    mostrarSnackbar('Registro Guardado');

    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
