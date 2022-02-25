import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_mart/data/login_controller.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_mart/shared/util.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({Key key}) : super(key: key);

  @override
  _AuthLoginState createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    double dWidth = MyUtility(context).width;
    double dHeight = MyUtility(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
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
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

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
          shape: StadiumBorder(
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
          avatar: Icon(Icons.power_settings_new_sharp),
        )
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Image.network(
        'https://pngimg.com/uploads/google/google_PNG19630.png',
        width: 32,
        height: 32,
      ),
      label: Text(
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
}
