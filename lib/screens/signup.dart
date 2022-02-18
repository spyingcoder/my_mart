import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_mart/shared/util.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(const Duration(seconds: 3), () {
    setState(() {
      selected = !selected;
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;
    print(dWidth);

    const colorizeColors = [
      Colors.white,
      Colors.brown,
    ];

    var colorizeTextStyle = TextStyle(
      fontSize: dHeight * 0.07,
      fontFamily: 'SupermercadoOne',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //
          //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP------------------->>>>
          //
          AnimatedPositioned(
            duration: const Duration(seconds: 5),
            curve: Curves.fastOutSlowIn,
            child: Center(
              child: SizedBox(
                width: dWidth * 0.80,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Welcome to MyMart",
                    style: colorizeTextStyle,
                  ),
                ),
              ),
            ),
            top: selected ? dHeight * .08 : dHeight * .5,
            left: dWidth * 0.1,
          ),
          //
          //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP------------------->>>>
          //
        ],
      ),
    );
  }
}
