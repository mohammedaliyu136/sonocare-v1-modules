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
                //textField(label: 'Speciality', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Speciality', controller: formVerificationProvider.specialityController, validator: (){}, onChanged: (){}),
                /*
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                                //mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Specialty', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                  if(!authController.loadingSpecialtyType)Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: DropdownButton<SpecialtyType>(
                                      isExpanded: true,
                                      dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                      underline: Container(color: Colors.transparent),
                                      items: authController.doctorTypeList.map((SpecialtyType nurseType) {
                                        return DropdownMenuItem<SpecialtyType>(
                                          value: nurseType,
                                          child: Text(nurseType.title.trim(), style: const TextStyle(color: Colors.white),),
                                        );
                                      }).toList(),
                                      onChanged: (value){
                                        verificationFormController.selectSpecialty(value!);
                                        setState(() {
                                          selectedSpecialtyTypeLocal = value;
                                        });
                                      },
                                      //value: formVerificationProvider.selectedNurseType.id,
                                      //value: formVerificationProvider.selectedSpecialtyType.id==''?authProvider.doctorTypeList[0]:formVerificationProvider.selectedSpecialtyType,
                                      value: selectedSpecialtyTypeLocal.id==''?authController.doctorTypeList[0]:selectedSpecialtyTypeLocal,
                                      //value: authProvider.doctorTypeList[0],
                                    ),
                                  ),
                                  if(authController.loadingSpecialtyType)Padding(
                                    padding: const EdgeInsets.only(top:30.0),
                                    child: Row(children: const [ Text('Loading Doctor Type', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
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
                const SizedBox(height: 15,),
                */
                /*
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(Icons.person, color: Colors.transparent,),
                          ),
                          SizedBox(width: 1,child: Container(color: Colors.white,), height: 61,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                              child: Stack(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Language Spoken', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0.0),
                                    child: LanguageDropDownMultiSelect(
                                      onChanged: (List<String> x) {
                                        setState(() {
                                          selected =x;
                                          verificationFormController.languageSpokenController.text=selected.join(',');
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        //border: OutlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.transparent)),
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 10,
                                        ),
                                      ),
                                      options: const ['English' , 'Hausa' , 'Igbo' , 'Yoruba'],
                                      selectedValues: selected,
                                      whenEmpty: 'Select Something',
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
                */
                //textField(label: 'Language Spoken', icon: Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Language Spoken', controller: formVerificationProvider.languageSpokenController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Lab Name', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Lab Name', controller: verificationFormController.labNameController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Lab Reg. No', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Lab Reg. No.', controller: verificationFormController.labRegNoController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                textField(label: 'Lab Code', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Lab Code', controller: verificationFormController.labCodeController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(Icons.person, color: Colors.transparent,),
                          ),
                          SizedBox(width: 1,child: Container(color: Colors.white,), height: 61,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                              child: Stack(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Specialty code', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                  Padding(
                                    padding: const EdgeInsets.only(top:0.0),
                                    child: LanguageDropDownMultiSelect(
                                      onChanged: (List<String> x) {
                                        setState(() {
                                          selectedSpecialtyCode =x;
                                          verificationFormController.specialityCodeController.text=selectedSpecialtyCode.join(',');
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        //border: OutlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.transparent)),
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 10,
                                        ),
                                      ),
                                      //options: ['English' , 'Hausa' , 'Igbo' , 'Yoruba'],
                                      options: const [
                                        'MBBS',
                                        'MBChB',
                                        'FWACS',
                                        'FWACP',
                                        'FRSC',
                                        'FRCP (UK)',
                                        'FRCOG',
                                        'FRACS',
                                        'FRACP',
                                        'FRACGP',
                                        'MRCP',
                                        'MGO',
                                        'MPH',
                                        'DRACOG',
                                        'DRCOG'
                                      ],
                                      selectedValues: selectedSpecialtyCode,
                                      whenEmpty: 'Select Something',
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
                const SizedBox(height: 15,),
                textField(label: 'Specialty code', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Specialty code', controller: verificationFormController.specialityCodeController, validator: (){}, onChanged: (){}),
                const SizedBox(height: 15,),
                GestureDetector(
                    onTap: ()=>verificationFormController.takePassport(),
                    child: textField(label: 'Passport', icon: const Icon(Icons.upload_rounded, color: Colors.white,), hintText: 'Select Passport', controller: verificationFormController.passportController, validator: (){}, onChanged: (){},enable: false,)),
              ],),
            );
          }
        );
      }
    );
  }
}
