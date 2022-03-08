import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_mart/screens/auth_login_screen.dart';
import 'package:my_mart/screens/home.dart';
import 'package:my_mart/screens/intro_screen.dart';
import 'package:my_mart/screens/login.dart';
import 'package:flutter/services.dart';
import 'package:my_mart/shared/colors.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetMaterialApp(
      title: 'MyMart',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Intro(),
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/authLogin': (context) => const AuthLogin(),
      },
      initialRoute: '/',
      theme: ThemeData(
        // fontFamily: 'SupermercadoOne',
        scaffoldBackgroundColor: Colors.red[50],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.red),
            ),
            primary: LightTheme.elevatedButton,
            textStyle: const TextStyle(
              fontFamily: 'Rowdies',
            ),
          ),
        ),
      ),
    );
  }
}
