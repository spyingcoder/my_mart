import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_mart/shared/util.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    // selected = true;
    Timer(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;

    const colorizeColors = [
      Colors.white,
      Colors.brown,
    ];

    var colorizeTextStyle = TextStyle(
      fontSize: dHeight * 0.07,
      fontFamily: 'SupermercadoOne',
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: dWidth * 0.80,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Welcome to MyMart',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/appstore.png',
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
