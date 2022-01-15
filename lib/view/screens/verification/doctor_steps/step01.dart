import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/specialty_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
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

  DoctorType selectedDoctorTypeLocal = DoctorType(id: '', title: '');

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
                                const Text('Gender', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                  underline: Container(color: Colors.transparent),
                                  items: ['Male', 'Female'].map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem, style: const TextStyle(color: Colors.white),),
                                    );
                                  }).toList(),
                                  onChanged: (value){
                                    verificationFormController.setGender(value!);
                                  },
                                  value: verificationFormController.genderController.text==''?'Male':verificationFormController.genderController.text,
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
                                          selected=x;
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
                const SizedBox(height: 15,),
                textField(label: 'MCDN Number', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter MCDN Number', controller: verificationFormController.mcdnNumberController, validator: (){}, onChanged: (){}),
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
                                  const Text('Specialty Code', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
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
                                  if(!authController.loadingDoctorType)Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: DropdownButton<DoctorType>(
                                      isExpanded: true,
                                      dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                      underline: Container(color: Colors.transparent),
                                      items: authController.doctorTypeList.map((DoctorType nurseType) {
                                        return DropdownMenuItem<DoctorType>(
                                          value: nurseType,
                                          child: Text(nurseType.title.trim(), style: const TextStyle(color: Colors.white),),
                                        );
                                      }).toList(),
                                      onChanged: (value){
                                        verificationFormController.selectSpecialty(value!);
                                        setState(() {
                                          selectedDoctorTypeLocal = value;
                                        });
                                      },
                                      //value: formVerificationProvider.selectedNurseType.id,
                                      //value: formVerificationProvider.selectedDoctorType.id==''?authProvider.doctorTypeList[0]:formVerificationProvider.selectedDoctorType,
                                      value: selectedDoctorTypeLocal.id==''?authController.doctorTypeList[0]:selectedDoctorTypeLocal,
                                      //value: authProvider.doctorTypeList[0],
                                    ),
                                  ),
                                  if(authController.loadingDoctorType)Padding(
                                    padding: const EdgeInsets.only(top:30.0),
                                    child: Row(children: const [Text('Loading Doctor Type', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
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
                //textField(label: 'Refer', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter your refer', controller: verificationFormController.referController, validator: (){}, onChanged: (){}),
                //const SizedBox(height: 15,),
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
