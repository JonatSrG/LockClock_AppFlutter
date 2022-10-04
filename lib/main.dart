import 'package:flutter/material.dart';
import 'package:lock_clock/src/bloc/provider.dart';
import 'package:lock_clock/src/pages/home_page.dart';
import 'package:lock_clock/src/pages/login_page.dart';
import 'package:lock_clock/src/pages/producto_page.dart';

import 'package:lock_clock/src/pages/scroll_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'scroll',
        routes: {
          'scroll': (BuildContext context) => ScrollPage(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}
