import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/dimensions.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/screens/auth/forget_password.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_up_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key,}) : super(key: key);
  @override
  OTPScreenState createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String _password = '';
  String _account = '';

  @override
  void initState() {
    if(Get.parameters['email']!=null){
      _emailController.text = Get.parameters['email'].toString();
      _account = Get.parameters['accountType'].toString();
      _password = Get.parameters['password'].toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 35),
                child: PinCodeTextField(
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.text,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    borderWidth: 3,
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Theme.of(context).disabledColor.withOpacity(0.2),
                    inactiveColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    activeColor: Theme.of(context).primaryColor.withOpacity(0.4),
                    activeFillColor: Theme.of(context).disabledColor.withOpacity(0.2),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: (val){},
                  beforeTextPaste: (text) => true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: normalButton(
                        backgroundColor: ColorResources.COLOR_PURPLE_MID,
                        button_text: 'submit'.tr,
                        primaryColor: ColorResources.COLOR_WHITE,
                        fontSize: 16,
                        onTap: () => _onLoginButtonPressed()
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onLoginButtonPressed({authProvider}){
    /*
    authProvider.login(_emailController.text, _password, _account).then((ResponseModel responseModel){
      if(responseModel.isSuccess){
        
      }else{
        showCustomSnackBar(responseModel.message, isError: true);
      }
    });
    */
    Get.toNamed('/verification', parameters: {'email':_emailController.text, 'password':_password,'accountType':_account});
  }
}
