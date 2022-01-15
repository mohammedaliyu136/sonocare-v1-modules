import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/app_controller.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/screens/auth/forget_password.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  String email = "";
  String password = "";
  LoginScreen({Key? key, this.email="", this.password=""}) : super(key: key);
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<LoginScreen> {
  //final _controller = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  //List<String> accountTypeList = ['Lab', 'Pharmacy', 'Delivery', 'Doctor', 'Nurse'];
  List<String> accountTypeList = ['Doctor', 'Nurse', 'Lab', 'Pharmacy', 'Ambulance', 'Delivery'];
  String selectedAccount = 'Doctor';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget.email.isNotEmpty){
      _emailController.text=widget.email;
      _passwordController.text=widget.password;
    }
    return Stack(
      children: [
        /*
            Obx(() {
              return
            }),
            */
        const BackGround(),
        GetBuilder<AuthController>(builder: (authController) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Form(
                key: _key,
                autovalidateMode:
                _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: ListView(
                  children: [
                    const SizedBox(height: 0,),
                    Image.asset(Images.main_logo_sm, height: 200, fit: BoxFit.contain,),
                    const SizedBox(height: 0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: textField(hintText: 'email_hint'.tr, label:'email'.tr, icon: const Icon(Icons.mail, color: Colors.white,), controller: _emailController, validator: (){}, onChanged: (){},),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: textField(obscureText: true, hintText: 'password_hint'.tr, label:'password'.tr, icon: const Icon(Icons.lock, color: Colors.white), controller: _passwordController, validator: (){}, onChanged: (){}),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
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
                    const SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          //Get.to(ForgetPasswordScreen());
                          Get.toNamed('/forget-password');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('forgot_password?'.tr, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 14),),
                        )),
                    const SizedBox(height: 10,),
                    if(authController.isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                    if(!authController.isLoading)
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: normalButton(
                              backgroundColor: ColorResources.COLOR_PURPLE_MID,
                              button_text: 'login'.tr,
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: () async {
                               Get.find<AppController>().setAccountType(accountType:selectedAccount);
                               String dashPath = '';
                               String loginUrl = '';
                               if(selectedAccount=='Lab'){
                                 dashPath = '/lab/dashboard';
                               }else if(selectedAccount=='Pharmacy'){
                                 dashPath = '/pharmacy/dashboard';
                               }else if(selectedAccount=='Delivery'){
                                 dashPath = '/delivery/dashboard';
                               }else if(selectedAccount=='Doctor'){
                                 dashPath = '/doctor/dashboard';
                                 loginUrl = '/api/doctorlogin';
                               }else if(selectedAccount=='Nurse'){
                                 dashPath = '/nurse/dashboard';
                                 loginUrl = '/api/nurselogin';
                               }else if(selectedAccount=='Ambulance'){
                                 dashPath = '/ambulance/dashboard';
                                 loginUrl = '/api/ambulancelogin';
                               }

                               if(selectedAccount=='Doctor' || selectedAccount=='Nurse'){
                                 authController.setAccountType(selectedAccount);
                                 authController.login(_emailController.text, _passwordController.text, loginUrl).then((ResponseModel response){
                                   if(response.isSuccess){
                                     Get.offAllNamed(dashPath);
                                   }else{

                                   }
                                 });
                               }else{
                                 Get.offAllNamed(dashPath);
                               }
                              }
                          )),
                        ],
                      ),
                    ),

                    //if(selectedAccount!='Doctor')if(nurseAuthProvider.isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        //Provider.of<AuthProvider>(context, listen: false).getServicePreferences();
                        //Provider.of<AuthProvider>(context, listen: false).getDoctorType();
                        //Navigator.pop(context);
                        //Get.to(const RegisterScreen());
                        Get.toNamed('/sign-up');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('dont_have_an_account?'.tr, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 14),),
                      ),
                    ),
                    const SizedBox(height: 40,),

                  ],),
              ),
            );
          }
        ),
      ],
    );
  }

  _onLoginButtonPressed(){}
}
