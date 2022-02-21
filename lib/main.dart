import 'package:flutter/material.dart';
import 'package:my_mart/screens/home.dart';
import 'package:my_mart/screens/intro_screen.dart';
import 'package:my_mart/screens/login.dart';
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
        '/': (context) => const Intro(),
        '/Home': (context) => const Home(),
        '/login': (context) => const Login(),
      },
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: 'SupermercadoOne',
        scaffoldBackgroundColor: Colors.blueGrey[900], //DARK MODE
        //scaffoldBackgroundColor: Colors.blueGrey[100],  //LIGHT MODE
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[900],
          ),
        ),
      ),
    );
  }
}
