import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_in_screen.dart';

class NotApprovedScreen extends StatelessWidget {
  String email="";
  String password="";
  NotApprovedScreen({Key? key, this.email="", this.password=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You will be notified when your account is approved. Thank You.', style: TextStyle(color: Colors.white, fontSize: 18, height: 1.8), textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              GetBuilder<AuthController>(builder: (authController) {
                  return normalButton(
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16,
                      button_text: 'Login',
                      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                      onTap: (){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => LoginScreen(email: authController.email, password: authController.password,)),
                          ModalRoute.withName('/'),
                        );
                      });
                }
              )
            ],
          ),
        ),
      )
    ],);
  }
}
