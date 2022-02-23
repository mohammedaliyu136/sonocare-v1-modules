import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/specialty_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/language_dropdown.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class Step01 extends StatefulWidget {
  const Step01({Key? key}) : super(key: key);

  @override
  _Step01State createState() {
    return _Step01State();
  }
}

class _Step01State extends State<Step01> {
  List<String> selected = [];
  List<String> selectedSpecialtyCode = [];
  SpecialtyType selectedSpecialtyTypeLocal = SpecialtyType(id: '', title: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  //hospitalNameController

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationFormController>(builder: (verificationFormController) {
        return GetBuilder<AuthController>(builder: (authController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(left: 26.0, top: 10.0, bottom: 20.0),
                  child:  Text('Personal Information', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
                ),
                textField(label: 'Pharmacy Name', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Hospital Name', controller: verificationFormController.hospitalNameController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Hospital Category', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Hospital Category', controller: verificationFormController.hospitalCategoryController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Primary Care', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Primary Care', controller: verificationFormController.primaryCareController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Secondary Care', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Secondary Care', controller: verificationFormController.secondaryCareController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Tertiary Care', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Tertiary Care', controller: verificationFormController.tertiaryCareController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Pharmacy reg Number', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Hospital reg Number', controller: verificationFormController.hospitalRegNumberController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Hospital Code', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Hospital Code', controller: verificationFormController.hospitalCodeController, validator: (){}, onChanged: (){}),
              ],),
            );
          }
        );
      }
    );
  }
}
