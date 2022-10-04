import 'package:flutter/material.dart';
import 'package:lock_clock/src/bloc/provider.dart';
import 'package:lock_clock/src/pages/cerrarsesion_page.dart';
import 'package:lock_clock/src/pages/editarRegistros_page.dart';
//import 'package:lock_clock/src/pages/verRegistro_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    //VerRegistroPage(),
    EditarRegistroPage(),
    CerrarSesionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(128, 139, 150, 1.0),
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(39, 55, 70, 1.0)),
            ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp),
              label: 'Registros'),
          BottomNavigationBarItem(
              icon: Icon(Icons.login_outlined), label: 'Cerrar Sesion'),
        ],
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
      ),
    );
  }
}
