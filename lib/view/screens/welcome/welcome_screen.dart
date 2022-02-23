import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/outLineButton.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_in_screen.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_up_screen.dart';
import 'package:sonocare_partner2/view/screens/rating/ratings_screen.dart';
class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    //Provider.of<AppProviderNurse>(context, listen: false).setFire();
    //Provider.of<AppProviderNurse>(context, listen: false).setContext(context);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Image.asset(Images.main_logo),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
          child: Text('welcome_to_SonoCare_your_health_is_our_priority'.tr, style: const TextStyle(
              color: ColorResources.COLOR_WHITE,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 1.6
          ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(child: normalButton(
                //backgroundColor: ColorResources.COLOR_PURPLE_MID,
                backgroundColor: Colors.red,
                button_text: 'login'.tr,
                primaryColor: ColorResources.COLOR_WHITE,
                fontSize: 16,
                onTap: (){
                  ///Get.to(LoginScreen());

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RateScreen()),
                  );
                },
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0, bottom: 10),
          child: Row(
            children: [
              Expanded(child: outLineButton(
                backgroundColor: ColorResources.COLOR_PURPLE_MID,
                button_text: 'Sign Up',
                primaryColor: ColorResources.COLOR_WHITE,
                fontSize: 14,
                onTap: (){
                  Get.find<AuthController>().getStates(context);
                  Get.toNamed('/account/type');
                },
              )),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(Images.scope),
          ],
        ),
      ],),
    );
  }
}
