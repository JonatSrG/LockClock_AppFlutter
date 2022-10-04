import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context),
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white10,
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/logo.gif'),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _textos() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.black)
        ],
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
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
            child: Text('Bienvenido', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
    );
  }
}
