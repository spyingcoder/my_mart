import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_mart/shared/colors.dart';
import 'package:my_mart/shared/util.dart';
import 'package:get/get.dart';
import 'package:my_mart/data/login_controller.dart';


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

  StreamSubscription internetconnection;
  bool isoffline = false;  //isoffline = false means inonline
  //set variable for Connectivity subscription listner



  @override
  void initState() {
    internetconnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // when every connection status is changed.
      if(result == ConnectivityResult.none){
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      }
    }); // using this listner, you can get the medium of connection as well.

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetconnection.cancel();
    //cancel internent connection subscription after you are done
  }

  //
  //CONTROLLER FOR AUTHENTICATION------------------------------------->>>>>>
  final controller = Get.put(LoginController());

  //
  //FORM VALIDATION FUNCTION ------------------------------------------------->>
  void validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;
    double formWidth = dWidth * 0.85;
    double formHeight = dHeight * 0.09;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            //
            //COLUMN THAT CONTAIN WHOLE BODY/PAGE----------------->>>>
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //
                Container(
                  child: errmsg("No Internet Connection Available", isoffline),
                  //to show internet connection message on isoffline = true.
                ),
                //
                //-------------------LOGO OF MART---------<<<<<<<<
                Padding(
                  padding: EdgeInsets.only(
                    top: dHeight * 0.05,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/appstore.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                //
                //GOOGLE SIGN IN AUTHENTICATION BUTTON--------------->>>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: formHeight * 0.3),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Obx(() {
                          if (controller.googleAccount.value == null) {
                            return buildLoginButton();
                          } else {
                            return buildProfileView();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
                //
                //DOUBLE HORIZONTAL BARS WITH "OR" TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //
                    //HORIZONTAL BAR - 1 --------------------->
                    //
                    Container(
                      height: 1.5,
                      width: dWidth * 0.4,
                      color: Colors.black,
                    ),
                    //
                    //"OR" TEXT --------------------------------->
                    //
                    Container(
                      margin: EdgeInsets.only(
                        left: dWidth * 0.01,
                        right: dWidth * 0.01,
                      ),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          fontSize: dHeight * 0.03,
                        ),
                      ),
                    ),
                    //
                    //HORIZONTAL BAR - 2 --------------------->
                    //
                    Container(
                      height: 1.5,
                      width: dWidth * 0.4,
                      color: Colors.black,
                    ),
                  ],
                ),
                //-------------------TEXT FOR REGISTER---------<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight * 0.60,
                  margin: EdgeInsets.only(top: dHeight * 0.02),
                  child: Text(
                    "Register Here:",
                    style: TextStyle(
                      fontSize: dHeight * 0.03,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //
                //-------------------IT WILL TAKE THE USERNAME----<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight,
                  margin: EdgeInsets.only(top: dHeight * 0.01),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: dHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
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
                //
                //-------------------IT WILL TAKE THE EMAIL-------<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight,
                  margin: EdgeInsets.only(top: dHeight * 0.01),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: dHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
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
                //
                //------------------IT WILL TAKE THE PASSWORD-----<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight,
                  margin: EdgeInsets.only(top: dHeight * 0.01),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: dHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
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
                //
                //-----------------IT WILL TAKE THE PHONE NUMBER--<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight,
                  margin: EdgeInsets.only(top: dHeight * 0.01),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: dHeight * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      // print(value.length);
                      if (value == "") {
                        return "Please Fill Phone Number";
                      } else if (value.length > 10 || value.length < 10) {
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
                //
                //-------------------BUTTON FOR REGISTER-------<<<<<<<<
                Container(
                  margin: EdgeInsets.only(top: dHeight * 0.02),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
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
                        color: LightTheme.elevatedButtonText,
                      ),
                    ),
                  ),
                ),
                //
                //RICHTEXT CONTAINING LOGIN GESTURE------------------->>>>>>>>
                Padding(
                  padding: EdgeInsets.only(top: dHeight * 0.02),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: dHeight * 0.02,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                      text: 'Already have an account!\t',
                      children: <TextSpan>[
                        TextSpan(
                            text: '\tLogin',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: dHeight * 0.03,
                              fontFamily: 'BalooBhaijaan2',
                              fontWeight: FontWeight.w900,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
                              }),
                      ],
                    ),
                  ),
                ),
                //
                //FORGET PASSWORD FIELD------------------------------->
                Container(
                  height: formHeight,
                  margin: EdgeInsets.symmetric(vertical: formHeight * 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: dHeight * 0.02,
                        fontFamily: 'BalooBhaijaan2',
                      ),
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

//ERROR MESSAGE WHICH WILL APPEAR --------------------------------->>>>
  Widget errmsg(String text,bool show){
    //error message widget.
    if(show == true){
      //if error is true then show error message box
      return Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [

          Container(
            margin: EdgeInsets.only(right:6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    }else{
      return Container();
      //if error is false, return empty container.
    }
  }

//GOOGLE SIGN IN BUTTON------------------------------->>>>>>>>>
  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Image.asset(
        'assets/images/google_logo.png',
        width: 32,
        height: 32,
      ),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(
          fontFamily: 'BalooBhaijaan2',
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
//
//WIDGET THAT WILL APPLY AFTER LOGIN----------------------------->
  Column buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline3,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        const SizedBox(
          height: 16,
        ),
        ActionChip(
          shape: const StadiumBorder(
            side: BorderSide(width: 3),
          ),
          elevation: 3,
          backgroundColor: Colors.white,
          label: const Text("Logout",
              style: TextStyle(
                fontFamily: 'BalooBhaijaan2',
                fontWeight: FontWeight.w700,
              )),
          onPressed: () {
            controller.logout();
          },
          avatar: const Icon(Icons.power_settings_new_sharp),
        )
      ],
    );
  }
//
}
