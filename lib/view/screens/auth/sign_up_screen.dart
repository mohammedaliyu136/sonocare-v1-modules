

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/ambulance_form.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/doctor_form.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/lab_form.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/logistic_form.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/nurse_form.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/forms/pharmacy_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _serviceIDController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool term_and_condition = false;
  bool _autoValidate = false;

  String selectedAccount = '';

  @override
  void initState() {
    if(Get.arguments!=null){
      selectedAccount = Get.arguments;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:selectedAccount =='doctor'?const DoctorForm()
              :selectedAccount =='nurse'?const NurseForm()
              :selectedAccount =='ambulance'?const AmbulanceForm()
              :selectedAccount =='lab'?const LabForm()
              :selectedAccount=='logistic'?const LogisticForm()
              :selectedAccount=='pharmacy'?const PharmacyForm():Container()
        ),
      ],
    );
  }
}
