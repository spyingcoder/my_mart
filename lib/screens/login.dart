import 'package:flutter/material.dart';
import 'package:my_mart/shared/util.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool selected = false;
  bool obscureText = true;

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
    double formWidth = dWidth * 0.85;
    double formHeight = dHeight * 0.09;
    var colorizeTextStyle = TextStyle(
      fontSize: dHeight * 0.07,
      fontFamily: 'SupermercadoOne',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
    //
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: dHeight,
                color: Colors.blueGrey[200],
                margin: EdgeInsets.only(top: dHeight * 0.2),
                width: dWidth,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: dHeight * 0.33,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          //------------------TEXT FOR LOGIN---------<<<<<<<<
                          SizedBox(
                            width: formWidth,
                            height: formHeight,
                            child: Center(
                              child: Text(
                                "Login Here",
                                style: TextStyle(
                                  fontSize: dHeight * 0.05,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blueGrey[800],
                                  fontFamily: 'BalooBhaijaan2',
                                ),
                              ),
                            ),
                          ),
                          //
                          //---------------IT WILL TAKE THE USERNAME----<<<<<<<<
                          Container(
                            width: formWidth,
                            height: formHeight,
                            margin: EdgeInsets.only(top: dHeight * 0.01),
                            child: TextFormField(
                              validator: (value) {
                                if (value == "") {
                                  return 'Please Fill Username';
                                } else if (value.length < 6) {
                                  return 'Username is too short';
                                }
                                return '';
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_sharp),
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            width: formWidth,
                            height: formHeight,
                            margin: EdgeInsets.only(top: dHeight * 0.02),
                            child: TextFormField(
                              obscureText: obscureText,
                              validator: (value) {
                                if (value == "") {
                                  return "Please Fill Password";
                                } else if (value.length < 8) {
                                  return "Password is Too Short";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                icon: const Icon(Icons.password_outlined),
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Colors.black),
                                // border: const OutlineInputBorder(),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(
                                    obscureText == true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP-------------->>>>
              //
              Material(
                elevation: 20,
                //This container will act as an appbar
                child: Container(
                  color: Colors.blueGrey[900],
                  height: dHeight * 0.2,
                  width: dWidth,
                  child: Stack(
                    children: [
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
                    ],
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
