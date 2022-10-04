import 'package:flutter/material.dart';

class CerrarSesionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(242, 243, 244, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.black26,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Cerrar Sesion', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
    );
  }
}
