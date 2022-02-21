import 'package:flutter/material.dart';
import 'package:my_mart/screens/home.dart';
import 'package:my_mart/screens/login.dart';
import 'package:my_mart/screens/signup.dart';
import 'package:flutter/services.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/signup': (context) => const SignUp(),
        '/login': (context) => const Login(),
      },
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: 'SupermercadoOne',
        scaffoldBackgroundColor: Colors.blueGrey[900], //DARK MODE
        //scaffoldBackgroundColor: Colors.blueGrey[100],  //LIGHT MODE
        //
      ),
    );
  }
}
