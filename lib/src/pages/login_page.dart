import 'package:flutter/material.dart';
import 'package:lock_clock/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _crearFondo(context),
            _loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          Text('¿Olvido la Contraseña?'),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.black),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electronico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.black),
              labelText: 'Password',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.black12,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoNegro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(40, 55, 71, 1.0),
          Color.fromRGBO(133, 146, 158, 1.0),
        ]),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoNegro,
        Positioned(top: 120.0, left: 30.0, child: circulo),
        Positioned(top: -30.0, left: 90.0, child: circulo),
        Positioned(bottom: -50.0, right: 40.0, child: circulo),
        Positioned(top: 50.0, right: 30.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin, color: Colors.white, size: 100.0),
              SizedBox(height: 15.0, width: double.infinity),
              Text('Bienvenido',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        ),
      ],
    );
  }
}
