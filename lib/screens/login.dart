import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_mart/data/login_controller.dart';
import 'package:my_mart/shared/colors.dart';
import 'package:my_mart/shared/util.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

//VALIDATION KEY
// final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
//CHANGED THE NAME OF GLOBAL KEY---------------------------------------------->>

//EMAIL VERIFICATION IN DART ------------------------------------------------->>

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

bool obscureText = true;

//EMAIL VERIFICATION IN DART ------------------------------------------------->>

class _LoginState extends State<Login> {
//
  //CONTROLLER FOR AUTHENTICATION------------------------------------->>>>>>
  final controller = Get.put(LoginController());
  //
  //FORM VALIDATION FUNCTION ------------------------------------------------->>
  // void validation() {
  //   final FormState _form = _formKey2.currentState;
  //   if (_form.validate()) {
  //     print("Yes");
  //   } else {
  //     print("No");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;
    double formWidth = dWidth * 0.85;
    double formHeight = dHeight * 0.09;
    //

    //
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // key: _formKey2,
            //COLUMN THAT CONTAIN WHOLE BODY/PAGE----------------->>>>
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                //-------------------TEXT FOR LOGIN---------<<<<<<<<
                Container(
                  width: formWidth,
                  height: formHeight * 0.60,
                  margin: EdgeInsets.only(top: dHeight * 0.02),
                  child: Text(
                    "Login Here:",
                    style: TextStyle(
                      fontSize: dHeight * 0.03,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //
                //-----------IT WILL TAKE THE USERNAME/PHONE NUMBER----<<<<<<<<
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
                        return 'Please Fill Username/Phone Number';
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
                //-------------------BUTTON FOR LOGIN-------<<<<<<<<
                Container(
                  margin: EdgeInsets.only(top: dHeight * 0.02),
                  padding: EdgeInsets.only(top: dHeight * 0.01),
                  width: formWidth,
                  height: formHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      // validation();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: dHeight * 0.04,
                        color: LightTheme.elevatedButtonText,
                      ),
                    ),
                  ),
                ),
                //
                //RICHTEXT CONTAINING REGISTER GESTURE------------------->>>>>>>>
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
                      text: 'Not have an account!\t',
                      children: <TextSpan>[
                        TextSpan(
                            text: '\tRegister',
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
                  height: formHeight * 0.5,
                  margin: EdgeInsets.symmetric(vertical: formHeight * 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
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
              ],
            ),
          ),
        ),
      ),
    );
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
        'Log in with Google',
        style: TextStyle(
          fontFamily: 'BalooBhaijaan2',
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

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
}
