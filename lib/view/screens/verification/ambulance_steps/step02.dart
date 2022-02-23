import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/state_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class Step02 extends StatelessWidget {
  const Step02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationFormController>(builder: (verificationFormController) {
        return Column(children: [
          const Padding(
            padding: EdgeInsets.only(left: 26.0, top: 10.0, bottom: 20.0),
            child: Text('Business Information', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.person, color: Colors.white,),
                  ),
                  SizedBox(width: 1,child: Container(color: Colors.white,), height: 64,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Country', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                          DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              items: verificationFormController.countries.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem, style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                              onChanged: (value){
                                verificationFormController.setCountry(value!);
                              },
                              value: verificationFormController.countryController.text==''?'Nigeria':verificationFormController.countryController.text
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
          const SizedBox(height: 15,),
          Column(
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
                          const Text('State', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                          if(!verificationFormController.isLoading)DropdownButton<StateModel>(
                            isExpanded: true,
                            dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                            underline: Container(color: Colors.transparent),
                            items: verificationFormController.states.map((StateModel dropDownStringItem) {
                              return DropdownMenuItem<StateModel>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem.name, style: const TextStyle(color: Colors.white),),
                              );
                            }).toList(),
                            onChanged: (value){
                              verificationFormController.selectState(value!);
                            },
                            value: verificationFormController.selectedState.id==-1?verificationFormController.states[0]:verificationFormController.selectedState
                          ),
                          if(verificationFormController.isLoading)Row(children: const [Text('Loading States', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
            ],
          ),
          const SizedBox(height: 15,),
          textField(label: 'Referred By', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter referred By', controller: verificationFormController.referredByController, validator: (){}, onChanged: (){}),
          const SizedBox(height: 15,),
          GestureDetector(
              onTap: ()=>verificationFormController.takeIDCard(),
              child: textField(label: 'ID Card', icon: const Icon(Icons.upload_rounded, color: Colors.white,), hintText: 'Select ID Card', controller: verificationFormController.idCardController, validator: (){}, onChanged: (){}, enable: false,)),

          textField(label: 'Account Number', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter account number', controller: verificationFormController.referredByController, validator: (){}, onChanged: (){}),
          const SizedBox(height: 15,),
          textField(label: 'Account Name', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter account name', controller: verificationFormController.referredByController, validator: (){}, onChanged: (){}),
          const SizedBox(height: 15,),
          textField(label: 'Account bank name', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter bank name', controller: verificationFormController.referredByController, validator: (){}, onChanged: (){}),
          const SizedBox(height: 15,),
        ],);
      }
    );
  }
}
