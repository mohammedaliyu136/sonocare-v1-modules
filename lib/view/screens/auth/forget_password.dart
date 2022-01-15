import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    if(Get.find<AuthController>().accountType.isNotEmpty){
      _emailController.text=Get.find<AuthController>().userInfoModel!.email;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> accountTypeList = ['doctor', 'nurse'];
  String selectedAccount = 'doctor';

  bool checkedEmail = false;
  bool isLoading = false;

  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  validate(){
    if(_emailController.text.isEmpty){
      showCustomSnackBar('error_email_can_not_be_empty'.tr, isError: true);
      return false;
    }
    if(_emailController.text.split('@').length!=2){
      showCustomSnackBar('error_email_is_not_valid'.tr, isError: true);
      return false;
    }
    if(checkedEmail){
      if(_otpController.text.isEmpty){
        showCustomSnackBar('error_otp_can_not_be_empty'.tr, isError: true);
        return false;
      }
      if(_passwordController.text.isEmpty){
        showCustomSnackBar('error_password_can_not_be_empty'.tr, isError: true);
        return false;
      }
      if(_passwordConfirmationController.text.isEmpty){
        showCustomSnackBar('error_password_Confirmation_can_not_be_empty'.tr, isError: true);
        return false;
      }
      if(_passwordController.text != _passwordConfirmationController.text){
        showCustomSnackBar('error_password_did_not_match'.tr, isError: true);
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('reset_password'.tr),
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
        ),
        body:  GetBuilder<AuthController>(builder: (authController) {
            return ListView(children: [
              const SizedBox(height: 20,),
              if(authController.accountType.isEmpty)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(Icons.person, color: Colors.transparent,),
                        ),
                        SizedBox(width: 1,child: Container(color: Colors.white,), height: 64,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                            child: Stack(
                              children: [
                                Text('account_type'.tr, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                    underline: Container(color: Colors.transparent),
                                    items: accountTypeList.map((String accountType) {
                                      return DropdownMenuItem<String>(
                                        value: accountType,
                                        child: Text(accountType, style: const TextStyle(color: Colors.white),),
                                      );
                                    }).toList(),
                                    onChanged: (value){
                                      setState(() {
                                        selectedAccount = value!;
                                        checkedEmail = false;
                                      });
                                    },
                                    value: selectedAccount,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: textField(hintText: 'email_hint'.tr, label:'email'.tr, icon: const Icon(Icons.mail, color: Colors.white,), controller: _emailController, validator: (){}, onChanged: (){}, enable: !checkedEmail,),
              ),
              const SizedBox(height: 20,),
              if(checkedEmail)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: textField(hintText: 'the_OTP_sent_to_your_phone_hint'.tr, label:'otp'.tr, icon: const Icon(Icons.code, color: Colors.transparent,), controller: _otpController, validator: (){}, onChanged: (){},),
              ),
              if(checkedEmail)const SizedBox(height: 20,),
              if(checkedEmail)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: textField(hintText: 'password_hint'.tr, label:'password'.tr, icon: const Icon(Icons.lock, color: Colors.white,), controller: _passwordController, validator: (){}, onChanged: (){},),
              ),
              if(checkedEmail)const SizedBox(height: 20,),
              if(checkedEmail)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: textField(hintText: 'confirm_password_hint'.tr, label:'confirm_password'.tr, icon: const Icon(Icons.lock, color: Colors.white,), controller: _passwordConfirmationController, validator: (){}, onChanged: (){},),
              ),
              if(checkedEmail)const SizedBox(height: 40,),
              if(isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
              if(!isLoading)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: normalButton(
                    backgroundColor: ColorResources.COLOR_PURPLE_MID,
                    button_text: !checkedEmail?'check_email'.tr:'reset_password'.tr,
                    primaryColor: ColorResources.COLOR_WHITE,
                    fontSize: 16,
                    onTap: () async {
                      /*
                          authProvider.checkEmail(_emailController.text, selectedAccount).then((ResponseModel responseModel){
                            if(responseModel.isSuccess){
                              setState(() {

                              });
                            }
                          });
                          */
                      //----------------
                      /**
                          bool res = validate();
                          if(res){
                          if(!checkedEmail){
                          setState(() {
                          isLoading = true;
                          });
                          authProvider.checkEmail(_emailController.text, selectedAccount).then((ResponseModel responseModel){
                          if(responseModel.isSuccess){
                          //responseModel.message
                          setState(() {
                          checkedEmail = true;
                          isLoading=false;
                          });
                          showCustomSnackBar(responseModel.message, context, isError: false);
                          }
                          });
                          }else{
                          setState(() {
                          isLoading = true;
                          });
                          authProvider.resetPassword(_emailController.text, selectedAccount, _otpController.text, _passwordController.text).then((ResponseModel responseModel){
                          if(responseModel.isSuccess){
                          //responseModel.message
                          setState(() {
                          checkedEmail = true;
                          isLoading=false;
                          });
                          showCustomSnackBar(responseModel.message, context, isError: false);
                          Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => LoginScreen(email: _emailController.text, password: _passwordController.text,)),
                          ModalRoute.withName('/'),
                          );
                          }
                          });
                          }
                          //await Future.delayed(const Duration(seconds: 5));

                          }
                       */
                    }),
              )
            ],);
          }
        )
      )
    ],);
  }
}
