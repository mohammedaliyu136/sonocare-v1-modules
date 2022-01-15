import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  void initState() {
    if(Get.find<AuthController>().accountType.isNotEmpty){
      selectedAccount = Get.find<AuthController>().accountType;
      _emailController.text=Get.find<AuthController>().userInfoModel!.email;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> accountTypeList = ['Lab', 'Pharmacy', 'Delivery', 'Doctor', 'Nurse'];
  String selectedAccount = 'Doctor';

  bool checkedEmail = false;
  bool isLoading = false;

  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  validate(){
    if(_emailController.text.isEmpty){
      showCustomSnackBar('Email can not be empty', isError: true);
      return false;
    }
    if(_emailController.text.split('@').length!=2){
      showCustomSnackBar('Email is not valid', isError: true);
      return false;
    }
    if(checkedEmail){
      if(_otpController.text.isEmpty){
        showCustomSnackBar('OTP can not be empty', isError: true);
        return false;
      }
      if(_passwordController.text.isEmpty){
        showCustomSnackBar('Password can not be empty', isError: true);
        return false;
      }
      if(_passwordConfirmationController.text.isEmpty){
        showCustomSnackBar('Password Confirmation can not be empty', isError: true);
        return false;
      }
      if(_passwordController.text != _passwordConfirmationController.text){
        showCustomSnackBar('Password did not match', isError: true);
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
          title: const Text('Reset Password1'),
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
        ),
        body: GetBuilder<AuthController>(builder: (authController) {
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
                                  const Text('Account Type', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
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
                  child: textField(hintText: 'Enter your Email', label:'Email', icon: const Icon(Icons.mail, color: Colors.white,), controller: _emailController, validator: (){}, onChanged: (){}, enable: authController.accountType.isNotEmpty?false:!checkedEmail,),
                ),
                const SizedBox(height: 20,),
                if(checkedEmail)Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: textField(hintText: 'Enter the OTP sent to your phone / email', label:'OTP', icon: const Icon(Icons.code, color: Colors.transparent,), controller: _otpController, validator: (){}, onChanged: (){},),
                ),
                if(checkedEmail)const SizedBox(height: 20,),
                if(checkedEmail)Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: textField(hintText: 'Enter your Password', label:'Password', icon: const Icon(Icons.lock, color: Colors.white,), controller: _passwordController, validator: (){}, onChanged: (){},),
                ),
                if(checkedEmail)const SizedBox(height: 20,),
                if(checkedEmail)Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: textField(hintText: 'Enter your Password Confirmation', label:'Password Confirmation', icon: const Icon(Icons.lock, color: Colors.white,), controller: _passwordConfirmationController, validator: (){}, onChanged: (){},),
                ),
                if(checkedEmail)const SizedBox(height: 40,),
                if(isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: [const CircularProgressIndicator(color: Colors.red,),],),
                if(!isLoading)Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: normalButton(
                      backgroundColor: ColorResources.COLOR_PURPLE_MID,
                      button_text: !checkedEmail?'Check Email':'Reset Password',
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16,
                      onTap: () async {
                        bool res = validate();
                        if(res){
                          if(!checkedEmail){
                            setState(() {
                              isLoading = true;
                            });
                            String url = '';
                            if(selectedAccount=='Lab'){
                              url = AppConstants.LAB_CHECK_EMAIL;
                            }else if(selectedAccount=='Pharmacy'){
                              url = AppConstants.PHARMACY_CHECK_EMAIL;
                            }else if(selectedAccount=='Delivery'){
                              url = AppConstants.DELIVERY_CHECK_EMAIL;
                            }else if(selectedAccount=='Doctor'){
                              url = AppConstants.DOCTOR_CHECK_EMAIL;
                            }else if(selectedAccount=='Nurse'){
                              url = AppConstants.NURSE_CHECK_EMAIL;
                            }
                            authController.checkEmail(_emailController.text, url).then((ResponseModel responseModel){
                              if(responseModel.isSuccess){
                                //responseModel.message
                                setState(() {
                                  checkedEmail = true;
                                  isLoading=false;
                                });
                                showCustomSnackBar(responseModel.message, isError: false);
                              }
                            });
                          }else{
                            setState(() {
                              isLoading = true;
                            });
                            String url = '';
                            if(selectedAccount=='Lab'){
                              url = AppConstants.LAB_RESET_PASSWORD;
                            }else if(selectedAccount=='Pharmacy'){
                              url = AppConstants.PHARMACY_RESET_PASSWORD;
                            }else if(selectedAccount=='Delivery'){
                              url = AppConstants.DELIVERY_RESET_PASSWORD;
                            }else if(selectedAccount=='Doctor'){
                              url = AppConstants.DOCTOR_RESET_PASSWORD;
                            }else if(selectedAccount=='Nurse'){
                              url = AppConstants.NURSE_RESET_PASSWORD;
                            }
                            authController.resetPassword(_emailController.text, url, _otpController.text, _passwordController.text).then((ResponseModel responseModel){
                              if(responseModel.isSuccess){
                                //responseModel.message
                                setState(() {
                                  checkedEmail = true;
                                  isLoading=false;
                                });
                                showCustomSnackBar(responseModel.message, isError: false);
                                /*
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => LoginScreen(email: _emailController.text, password: _passwordController.text,)),
                                  ModalRoute.withName('/'),
                                );
                                */
                              }
                            });
                          }
                          //await Future.delayed(const Duration(seconds: 5));

                        }

                      }),
                )
              ],);
            }
        ),
      )
    ],);
  }
}
