import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_mart/screens/auth_login_screen.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Intro(),
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/authLogin': (context) => const AuthLogin(),
      },
      //PERMANENT----->>>>
      initialRoute: '/',
      //TEST---------->>>>
      // initialRoute: '/login',
      theme: ThemeData(
        fontFamily: 'SupermercadoOne',
        scaffoldBackgroundColor: Colors.blue[800], //DARK MODE
        //scaffoldBackgroundColor: Colors.blueGrey[100],  //LIGHT MODE
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(
              side: BorderSide(width: 3),
            ),
            elevation: 1,
            primary: Colors.blue[800],
            textStyle: const TextStyle(
              fontFamily: 'Rowdies',
              // fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
