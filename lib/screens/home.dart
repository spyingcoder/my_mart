import 'package:flutter/material.dart';
import 'package:my_mart/shared/util.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//VALIDATION KEY
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//EMAIL VERIFICATION IN DART ------------------------------------------------->>

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

bool obscureText = true;

//EMAIL VERIFICATION IN DART ------------------------------------------------->>

class _HomeState extends State<Home> {
  void validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

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
    double formWidth = dWidth * 0.85;
    double formHeight = dHeight * 0.09;

    var colorizeTextStyle = TextStyle(
      fontSize: dHeight * 0.07,
      fontFamily: 'SupermercadoOne',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          //CHILD AT THE TOP IN THIS HAS LOWEST PRIORITY
          children: <Widget>[
            // This container will be the body of this page-------------->
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                //----------------CONTAINER FOR DECORATING FORM AREA------>
                child: Container(
                  color: Colors.white,
                  height: dHeight,
                  margin: EdgeInsets.only(top: dHeight * 0.1),
                  width: dWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //-------------------TEXT FOR REGISTER---------<<<<<<<<
                      Container(
                        width: formWidth,
                        height: formHeight,
                        margin: EdgeInsets.only(top: dHeight * 0.05),
                        child: Center(
                          child: Text(
                            "Register Here",
                            style: TextStyle(
                              fontSize: dHeight * 0.05,
                              fontWeight: FontWeight.w900,
                              // color: Colors.blueGrey[800],
                              fontFamily: 'BalooBhaijaan2',
                            ),
                          ),
                        ),
                      ),
                      //-------------------IT WILL TAKE THE USERNAME----<<<<<<<<
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
                      //-------------------IT WILL TAKE THE EMAIL-------<<<<<<<<
                      Container(
                        width: formWidth,
                        height: formHeight,
                        margin: EdgeInsets.only(top: dHeight * 0.02),
                        child: TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Email";
                            } else if (!regExp.hasMatch(value)) {
                              return "Email is Invalid";
                            }
                            return "";
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_sharp),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      //------------------IT WILL TAKE THE PASSWORD-----<<<<<<<<
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
                            prefixIcon: const Icon(Icons.password_outlined),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
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
                      //-----------------IT WILL TAKE THE PHONE NUMBER--<<<<<<<<
                      Container(
                        width: formWidth,
                        height: formHeight,
                        margin: EdgeInsets.only(top: dHeight * 0.02),
                        child: TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Phone Number";
                            } else if (value.length < 11) {
                              return "Phone Number is Invalid";
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      //-------------------BUTTON FOR REGISTER-------<<<<<<<<
                      Container(
                        margin: EdgeInsets.only(top: dHeight * 0.02),
                        width: formWidth,
                        height: formHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: dHeight * 0.04,
                              color: Colors.blueGrey[50],
                            ),
                          ),
                        ),
                      ),
                      //ROW CONTAINING LOGIN BUTTON
                      Padding(
                        padding: EdgeInsets.only(
                          top: dHeight * 0.01,
                          left: dHeight * 0.05,
                        ),
                        child: Row(
                          children: <Widget>[
                            //CHILD - 1 TEXT
                            const Text(
                              "I already have an account!",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700),
                            ),
                            //CHILD - 2 SIZEDBOX
                            const SizedBox(
                              width: 10,
                            ),
                            //CHILD - 3 LOGIN BUTTON
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: dHeight * 0.04,
                                    fontFamily: 'BalooBhaijaan2',
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FloatingActionButton(
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 32,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/authLogin'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP--------------->>>>
            //
            Material(
              elevation: 20,
              //This container will act as an appbar
              child: Container(
                color: Colors.blue[800],
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
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/appstore.png',
                                    width: dHeight * 0.075,
                                    height: dHeight * 0.075,
                                  ),
                                ),
                                SizedBox(
                                  width: dHeight * 0.04,
                                ),
                                Text(
                                  "Welcome to MyMart",
                                  style: colorizeTextStyle,
                                ),
                              ],
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
            //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP-------------->>>>
            //
          ],
        ),
      ),
    );
  }
}
