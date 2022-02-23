import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({Key? key}) : super(key: key);

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dobController = TextEditingController();
  final _lgaIDController = TextEditingController();
  final _stateIDController = TextEditingController();
  final _feeController = TextEditingController();
  final _serviceIDController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool term_and_condition = false;

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
            child: textField(hintText: 'name_hint'.tr, label:'name'.tr, icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _nameController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'email_hint'.tr, label:'email'.tr, icon: const Icon(Icons.mail, color: Colors.white,), controller: _emailController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'phone_number_hint'.tr, label:'phone_number'.tr, icon: const Icon(Icons.call, color: Colors.white,), controller: _phoneNumberController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(hintText: 'dob_hint', label:'dob'.tr, icon: const Icon(Icons.call, color: Colors.white,), controller: _dobController, validator: (){}, onChanged: (){}),
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
            child: textField(obscureText: true, hintText: 'service_id_hint'.tr, label:'service_id'.tr, icon: const Icon(Icons.lock, color: Colors.transparent), controller: _serviceIDController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(obscureText: true, hintText: 'lga_id_hint'.tr, label:'service_id'.tr, icon: const Icon(Icons.lock, color: Colors.transparent), controller: _lgaIDController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(obscureText: true, hintText: 'state_id_hint'.tr, label:'service_id'.tr, icon: const Icon(Icons.lock, color: Colors.transparent), controller: _stateIDController, validator: (){}, onChanged: (){}),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: textField(obscureText: true, hintText: 'fee_hint'.tr, label:'fee'.tr, icon: const Icon(Icons.lock, color: Colors.transparent), controller: _feeController, validator: (){}, onChanged: (){}),
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
    String _name = _nameController.text.trim();
    String _email = _emailController.text.trim();
    String _number = _phoneNumberController.text.trim();
    String _serviceID = _serviceIDController.text.trim();
    String _lgaID = _lgaIDController.text.trim();
    String _stateID = _stateIDController.text.trim();
    String _fee = _feeController.text.trim();
    String _dob = _dobController.text.trim();
    String _password = _passwordController.text.trim();
    String _confirmPassword = _passwordConfirmationController.text.trim();

    /*
    if (_name.isEmpty) {
      showCustomSnackBar('enter_name'.tr);
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
      LogisticSignUpBody logisticSignUpBody = LogisticSignUpBody(name: _name, email: _email, phone: _number, password: _password, serviceID: _serviceID, dob: _dob, lgaID: _lgaID, fee: _fee, stateID: _stateID);
      authController.registration(logisticSignUpBody:logisticSignUpBody, accountType: 'logistic').then((status) async {
        if (status.isSuccess) {
        }else {
          showCustomSnackBar(status.message);
        }
      });
    }*/
    Get.toNamed('/otp', parameters: {'email':_email, 'password':_password,'accountType':'delivery'});
  }
}
