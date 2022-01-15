import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class NurseForm extends StatefulWidget {
  const NurseForm({Key? key}) : super(key: key);

  @override
  State<NurseForm> createState() => _NurseFormState();
}

class _NurseFormState extends State<NurseForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nurseTypeController = TextEditingController();
  final _addressController = TextEditingController();
  final _hospitalIDController = TextEditingController();
  final _nurseServiceController = TextEditingController();
  final _serviceIDController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool term_and_condition = false;


  NurseType selectedNurseType = NurseType(id: '', title: '');
  NurseService selectedNurseService = NurseService(id: '', title: '');
  ServicePref selectedServicePref = ServicePref(id: '', type: '');

  @override
  void initState() {
    Get.find<AuthController>().getNurseType();
    Get.find<AuthController>().getNurseService();
    Get.find<AuthController>().getServicePreferences();
    //Get.find<AuthController>().getServicePreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AuthController>(builder: (authController) {
      return ListView(
        children: [
          const SizedBox(height: 0,),
          Image.asset(Images.main_logo_sm, height: 200, fit: BoxFit.contain,),
          const SizedBox(height: 0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'first_name_hint'.tr, label:'first_name'.tr, icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _firstNameController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'last_name_hint'.tr, label:'last_name'.tr, icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _lastNameController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'other_name_hint'.tr, label:'other_name'.tr, icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _otherNameController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'email_hint'.tr, label:'email'.tr, icon: const Icon(Icons.mail, color: Colors.white,), controller: _emailController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'address_hint'.tr, label:'address'.tr, icon: const Icon(Icons.pin_drop, color: Colors.white,), controller: _addressController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'phone_number_hint'.tr, label:'phone_number'.tr, icon: const Icon(Icons.call, color: Colors.white,), controller: _phoneNumberController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(obscureText: true, hintText: 'password_hint'.tr, label:'password'.tr, icon: const Icon(Icons.lock, color: Colors.white), controller: _passwordController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(obscureText: true, hintText: 'confirm_password_hint'.tr, label:'confirm_password'.tr, icon: const Icon(Icons.lock, color: Colors.white), controller: _passwordConfirmationController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'hospital_id_hint'.tr, label:'hospital'.tr, icon: const Icon(Icons.local_hospital, color: Colors.white,), controller: _hospitalIDController, validator: (){}, onChanged: (){}),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('nurse_service'.tr, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                            if(!authController.loadingNurseServices)DropdownButton<NurseService>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: authController.nurseServicesList.map((NurseService dropDownStringItem) {
                                return DropdownMenuItem<NurseService>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem.title.trim(), style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                              onChanged: (value){
                                selectedNurseService = value!;
                                _nurseServiceController.text = selectedNurseService.title;
                              },
                              value: selectedNurseService.title==''?authController.nurseServicesList[0]:selectedNurseService,
                            ),
                            if(authController.loadingNurseServices)Row(children: const [Text('Loading Nurse Service', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('service_preference'.tr, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                            if(!authController.loadingServicePreferences)DropdownButton<ServicePref>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: authController.servicePreferencesList.map((ServicePref dropDownStringItem) {
                                return DropdownMenuItem<ServicePref>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem.type.trim(), style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                              onChanged: (value){
                                selectedServicePref = value!;
                                _serviceIDController.text = selectedServicePref.id;
                              },
                              value: selectedServicePref.type==''?authController.servicePreferencesList[0]:selectedServicePref,
                            ),
                            if(authController.loadingServicePreferences)Row(children: const [Text('Loading Service Preference', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('nurse_type'.tr, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                            if(!authController.loadingDoctorType)DropdownButton<NurseType>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: authController.nurseTypeList.map((NurseType dropDownStringItem) {
                                return DropdownMenuItem<NurseType>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem.title.trim(), style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                              onChanged: (value){
                                selectedNurseType = value!;
                                _nurseTypeController.text = selectedNurseType.title;
                              },
                              value: selectedNurseType.title==''?authController.nurseTypeList[0]:selectedNurseType,
                            ),
                            if(authController.loadingDoctorType)Row(children: const [Text('Loading Nurse Type', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
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
          Row(
            children: [
              Checkbox(value: term_and_condition, onChanged: (bool? value) {setState(() {term_and_condition=value!;});}, fillColor: MaterialStateProperty.all(ColorResources.COLOR_PURPLE_MID),),
              //SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){setState(() {term_and_condition=!term_and_condition;});},
                  child: Text('i_accept_the_terms_and_conditions'.tr, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white, fontSize: 14),)),
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
            child: !authController.isLoading ? Row(
              children: [
                Expanded(child: normalButton(
                  backgroundColor: ColorResources.COLOR_PURPLE_MID,
                  button_text: 'signup'.tr,
                  primaryColor: ColorResources.COLOR_WHITE,
                  fontSize: 16,
                  onTap: authController.acceptTerms ? () => _register(authController) : (){},
                )),
              ],
            ):const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: ()=>Get.toNamed('/sign-in'),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('already_have_an_account?'.tr, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 14),),
            ),
          ),
          const SizedBox(height: 20,),

        ],);
    }
    );
  }

  void _register(AuthController authController) async {
    String _firstName = _firstNameController.text.trim();
    String _lastName = _lastNameController.text.trim();
    String _otherName = _otherNameController.text.trim();
    String _email = _emailController.text.trim();
    String _address = _addressController.text.trim();
    String _nurseService = _nurseServiceController.text.trim();
    String _hospitalID = _hospitalIDController.text.trim();
    String _number = _phoneNumberController.text.trim();
    String _serviceID = _serviceIDController.text.trim();
    String _nurseType = _nurseTypeController.text.trim();
    String _password = _passwordController.text.trim();
    String _confirmPassword = _passwordConfirmationController.text.trim();

    /*
    if (_firstName.isEmpty) {
      showCustomSnackBar('enter_first_name'.tr);
    }else if (_lastName.isEmpty) {
      showCustomSnackBar('enter_last_name'.tr);
    }else if (_otherName.isEmpty) {
      showCustomSnackBar('enter_other_name'.tr);
    }else if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    }else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    }else if (_number.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    }else if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (_password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    }else if (_password != _confirmPassword) {
      showCustomSnackBar('confirm_password_does_not_matched'.tr);
    }else {
      NurseSignUpBody nurseSignUpBody = NurseSignUpBody(firstName: _firstName, lastName: _lastName, otherName: _otherName, email: _email, phone: _number, password: _password, serviceID: _serviceID, nurseType: _nurseType, nurseService: _nurseService, address: _address, hospitalID: _hospitalID);
      authController.registration(nurseSignUpBody:nurseSignUpBody, accountType: 'nurse').then((status) async {
        if (status.isSuccess) {
        }else {
          showCustomSnackBar(status.message);
        }
      });
    }*/
    Get.toNamed('/otp', parameters: {'email':_email, 'password':_password,'accountType':'nurse'});
  }
}
