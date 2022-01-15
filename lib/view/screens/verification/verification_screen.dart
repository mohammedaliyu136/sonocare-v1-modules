import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/view/screens/verification/ambulance_steps/ambulance_step.dart';
import 'package:sonocare_partner2/view/screens/verification/doctor_steps/doctor_step.dart';
import 'package:sonocare_partner2/view/screens/verification/lab_steps/lab_step.dart';
import 'package:sonocare_partner2/view/screens/verification/logistic_steps/logistic_step.dart';
import 'package:sonocare_partner2/view/screens/verification/nurse_steps/nurse_step.dart';
import 'package:sonocare_partner2/view/screens/verification/pharmacy_steps/pharmacy_step.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String selectedAccount = '';
  @override
  void initState() {
    if(Get.parameters['email']!=null){
      selectedAccount = Get.parameters['accountType'].toString();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return selectedAccount =='doctor'?const DoctorVerificationScreen()
          :selectedAccount =='nurse'?const NurseVerificationScreen()
          :selectedAccount =='ambulance'?const AmbulanceVerificationScreen()
          :selectedAccount =='lab'?const LabVerificationScreen()
          :selectedAccount =='logistic'?const LogisticVerificationScreen()
          :selectedAccount =='pharmacy'?const PharmacyVerificationScreen():Container();
  }
}
