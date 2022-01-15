import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class Step04 extends StatelessWidget {
  const Step04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationFormController>(builder: (verificationFormController) {
        return Column(children: [
          const Padding(
            padding: EdgeInsets.only(left: 26.0, top: 10.0, bottom: 20.0),
            child: Text('Professional/Work Information', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
          textField(label: 'Hospital / Company / Organisation', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Company / Organisation', controller: verificationFormController.companyOrganisationController, validator: (){}, onChanged: (){}),
          const SizedBox(height: 15,),
          GestureDetector(
              onTap: ()=>DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1960, 1, 1),
                  maxTime: DateTime.now(),
                  theme: const DatePickerTheme(
                      headerColor: ColorResources.COLOR_PURPLE_DEEP,
                      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                      itemStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle:
                      TextStyle(color: Colors.white, fontSize: 16)),
                  onChanged: (date) {
                     List<String> datearray = date.toString().split(' ')[0].split('-');
                     String dateStr = datearray[2]+'/'+datearray[1]+'/'+datearray[0];
                     verificationFormController.setFromDate(dateStr);
                  }, onConfirm: (date) {
                    List<String> datearray = date.toString().split(' ')[0].split('-');
                    String dateStr = datearray[2]+'/'+datearray[1]+'/'+datearray[0];
                    verificationFormController.setFromDate(dateStr);
                  }, currentTime: DateTime.now(), locale: LocaleType.en),
              child: textField(label: 'From', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter date you started', controller: verificationFormController.fromController, validator: (){}, onChanged: (){}, enable: false,)),
          const SizedBox(height: 15,),
          GestureDetector(
              onTap: ()=>DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1960, 1, 1),
                  maxTime: DateTime.now(),
                  theme: const DatePickerTheme(
                      headerColor: ColorResources.COLOR_PURPLE_DEEP,
                      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                      itemStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle:
                      TextStyle(color: Colors.white, fontSize: 16)),
                  onChanged: (date) {
                    List<String> datearray = date.toString().split(' ')[0].split('-');
                    String dateStr = datearray[2]+'/'+datearray[1]+'/'+datearray[0];
                    verificationFormController.setToDate(dateStr);
                  }, onConfirm: (date) {
                    List<String> datearray = date.toString().split(' ')[0].split('-');
                    String dateStr = datearray[2]+'/'+datearray[1]+'/'+datearray[0];
                    verificationFormController.setToDate(dateStr);
                  }, currentTime: DateTime.now(), locale: LocaleType.en),
              child: textField(label: 'To', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Leave as is you still work here', controller: verificationFormController.toController, validator: (){}, onChanged: (){}, enable: false,)),
          const SizedBox(height: 15,),
          Row(children: [
          Theme(
          data: ThemeData(unselectedWidgetColor: ColorResources.COLOR_WHITE,),
          child: Checkbox(
              activeColor: ColorResources.COLOR_PURPLE_MID,
              value: verificationFormController.iCurrentlyWorkHere, onChanged: (val)=>verificationFormController.setICurrentlyWorkHere(val)),),
            //Checkbox(value: formVerificationProvider.iCurrentlyWorkHere, onChanged: (val)=>formVerificationProvider.setICurrentlyWorkHere(val)),
            GestureDetector(child: const Text('I Currently Work Here', style: TextStyle(color: Colors.white, fontSize: 16),), onTap: ()=>verificationFormController.setICurrentlyWorkHere(!verificationFormController.iCurrentlyWorkHere),)
          ],),
        ],);
      }
    );
  }
}
