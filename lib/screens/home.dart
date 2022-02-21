import 'package:flutter/material.dart';
import 'package:my_mart/shared/util.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;

    var colorizeTextStyle = TextStyle(
      fontSize: dHeight * 0.07,
      fontFamily: 'SupermercadoOne',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            //CHILD AT THE TOP IN THIS HAS LOWEST PRIORITY
            children: <Widget>[
              //This container will be the body of this page
              Container(
                color: Colors.blueGrey[200],
                height: dHeight,
                margin: EdgeInsets.only(top: dHeight * 0.2),
                width: dWidth,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: dHeight * 0.05),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: const TextStyle(),
                          border: const OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP----------------->>>>
              //
              Material(
                elevation: 20,
                //This container will act as an appbar
                child: Container(
                  color: Colors.blueGrey[900],
                  height: dHeight * 0.2,
                  width: dWidth,
                  child: AnimatedPositioned(
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
                ),
              ),
              //
              //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP----------------->>>>
              //
            ],
          ),
        ),
      ),
    );
  }
}
