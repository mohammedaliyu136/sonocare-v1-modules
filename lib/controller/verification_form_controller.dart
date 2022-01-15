import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/specialty_model.dart';
import 'package:sonocare_partner2/data/model/response/state_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/data/model/response/verification_model.dart';
import 'package:sonocare_partner2/data/repository/country_repo.dart';
import 'package:sonocare_partner2/data/repository/state_repo.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';

class VerificationFormController extends GetxController implements GetxService {
  TextEditingController genderController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController specialityCodeController = TextEditingController();
  TextEditingController specialityCodeOtherController = TextEditingController();
  TextEditingController languageSpokenController = TextEditingController();
  TextEditingController mcdnNumberController = TextEditingController();
  TextEditingController otherLanguageController = TextEditingController();
  TextEditingController passportController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankCodeController = TextEditingController();
  XFile? passport;

  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  StateModel selectedState = StateModel(id: -1, name: "Choose a state");
  String? gender;
  LGAModel selectedLGA = LGAModel(id: -1, name: 'Choose ...');
  TextEditingController referredByController = TextEditingController();
  TextEditingController idCardController = TextEditingController();
  XFile? idCard;

  TextEditingController degreeCertificateController = TextEditingController();
  XFile? degreeCertificate;
  TextEditingController nigeriaMedicalLicenseController = TextEditingController();
  XFile? nigeriaMedicalLicense;
  TextEditingController specialistDocumentsController = TextEditingController();
  XFile? specialistDocuments;
  TextEditingController aboutMeController = TextEditingController();

  TextEditingController companyOrganisationController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  bool iCurrentlyWorkHere = false;

  bool isLoading = false;

  DoctorType selectedDoctorType = DoctorType(id: '', title: '');
  NurseType selectedNurseType = NurseType(id: '', title: '');

  List<String> countries = [];
  List<StateModel> states = [StateModel(id: -1, name: "Choose a state")];


  setGender(gender){
    genderController.text=gender;
    update();
  }
  setStates(states){
    this.states=states;
    update();
  }
  setCountry(country){
    countryController.text=country;
    update();
  }
  selectState(StateModel stateName){
    selectedState=stateName;
    stateController.text = stateName.name;
    update();
  }
  setICurrentlyWorkHere(_iCurrentlyWorkHere){
    iCurrentlyWorkHere=_iCurrentlyWorkHere;
    update();
  }
  setFromDate(_date){
    fromController.text=_date;
    update();
  }
  setToDate(_date){
    toController.text=_date;
    update();
  }
  selectSpecialty(DoctorType specialty){
    specialityController.text=specialty.title;
    selectedDoctorType = specialty;
    update();
  }
  selectNurseSpecialty(NurseType specialty){
    specialityController.text=specialty.title;
    selectedNurseType = specialty;
    update();
  }


  //set files
  takePassport() async {
    final ImagePicker _picker = ImagePicker();
    passport = await _picker.pickImage(source: ImageSource.camera);
    passportController.text=passport!.path;
    update();
  }
  takeIDCard() async {
    final ImagePicker _picker = ImagePicker();
    idCard = await _picker.pickImage(source: ImageSource.gallery);
    idCardController.text=idCard!.path;
    update();
  }
  takeDegreeCertificate() async {
    final ImagePicker _picker = ImagePicker();
    degreeCertificate = await _picker.pickImage(source: ImageSource.gallery);
    degreeCertificateController.text=degreeCertificate!.path;
    update();
  }
  takeNigeriaMedicalLicense() async {
    final ImagePicker _picker = ImagePicker();
    nigeriaMedicalLicense = await _picker.pickImage(source: ImageSource.gallery);
    nigeriaMedicalLicenseController.text=nigeriaMedicalLicense!.path;
    update();
  }
  takeSpecialistDocuments() async {
    final ImagePicker _picker = ImagePicker();
    specialistDocuments = await _picker.pickImage(source: ImageSource.gallery);
    specialistDocumentsController.text=specialistDocuments!.path;
    update();
  }

  getAllStates() async {
    print('00000');
    if(states.isNotEmpty){
      isLoading=true;
      countries = [];
      List<String>? countriesResponse = await getCountries();
      countries.addAll(countriesResponse!);
      update();
      List<StateModel> response = await getState_v1();
      states = [];
      states = [StateModel(id: -1, name: "Choose a state")];
      states.addAll(response);
      isLoading=false;
      update();
    }
  }

  VerificationModel step1Verified(context){
    if(this.specialityController.text.isEmpty){
      //showCustomSnackBar('You have to enter speciality',  isError: true);
      //return VerificationModel(verified: false, message: '');
    }
    if(this.languageSpokenController.text.isEmpty){
      showCustomSnackBar('You have to enter language Spoken',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.mcdnNumberController.text.isEmpty){
      showCustomSnackBar('You have to enter MCDN',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.passport==null){
      showCustomSnackBar('You have to upload your passport',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel step2Verified(context){
    if(this.stateController.text.isEmpty){
      showCustomSnackBar('You have to select State',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.idCard==null){
      showCustomSnackBar('You have to upload your ID Card',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.accountNumberController.text.isEmpty){
      showCustomSnackBar('You have to enter account number',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.accountNameController.text.isEmpty){
      showCustomSnackBar('You have to enter account name',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.bankCodeController.text.isEmpty){
      showCustomSnackBar('You have to enter bank code',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel step3Verified(context){
    if(this.aboutMeController.text.isEmpty){
      showCustomSnackBar('The about me can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.degreeCertificate==null){
      showCustomSnackBar('You have to upload your Degree Certificate',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.nigeriaMedicalLicense==null){
      showCustomSnackBar('You have to upload your Nigeria Medical License',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.specialistDocuments==null){
      showCustomSnackBar('You have to upload your Specialist Supporting Documents',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel step4Verified(context){
    if(this.companyOrganisationController.text.isEmpty){
      showCustomSnackBar('The Company / Organisation can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.fromController.text.isEmpty){
      showCustomSnackBar('From date can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }

  VerificationModel nurseStep1Verified(context){
    if(this.specialityController.text.isEmpty){
      //showCustomSnackBar('You have to enter speciality',  isError: true);
      //return VerificationModel(verified: false, message: '');
    }
    if(this.languageSpokenController.text.isEmpty){
      //showCustomSnackBar('You have to enter language Spoken 21',  isError: true);
      //return VerificationModel(verified: false, message: '');
    }
    if(this.mcdnNumberController.text.isEmpty){
      showCustomSnackBar('You have to enter MCDN',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.passport==null){
      showCustomSnackBar('You have to upload your passport',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel nurseStep2Verified(context){
    if(this.stateController.text.isEmpty){
      showCustomSnackBar('You have to select State',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.idCard==null){
      showCustomSnackBar('You have to upload your ID Card',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.accountNumberController.text.isEmpty){
      showCustomSnackBar('You have to enter account number',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.accountNameController.text.isEmpty){
      showCustomSnackBar('You have to enter account name',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.bankCodeController.text.isEmpty){
      showCustomSnackBar('You have to enter bank code',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel nurseStep3Verified(context){
    if(this.aboutMeController.text.isEmpty){
      showCustomSnackBar('The about me can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.degreeCertificate==null){
      showCustomSnackBar('You have to upload your Degree Certificate',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.nigeriaMedicalLicense==null){
      showCustomSnackBar('You have to upload your Nigeria Medical License',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.specialistDocuments==null){
      showCustomSnackBar('You have to upload your Specialist Supporting Documents',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel nurseStep4Verified(context){
    if(this.companyOrganisationController.text.isEmpty){
      showCustomSnackBar('The Company / Organisation can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.fromController.text.isEmpty){
      showCustomSnackBar('From date can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }

  VerificationModel doctorStep1Verified(context){
    if(this.specialityController.text.isEmpty){
      //showCustomSnackBar('You have to enter speciality',  isError: true);
      //return VerificationModel(verified: false, message: '');
    }
    if(this.languageSpokenController.text.isEmpty){
      showCustomSnackBar('You have to enter language Spoken',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.mcdnNumberController.text.isEmpty){
      showCustomSnackBar('You have to enter MCDN',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.passport==null){
      showCustomSnackBar('You have to upload your passport',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel doctorStep2Verified(context){
    if(this.stateController.text.isEmpty){
      showCustomSnackBar('You have to select State',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.idCard==null){
      showCustomSnackBar('You have to upload your ID Card',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel doctorStep3Verified(context){
    if(this.aboutMeController.text.isEmpty){
      showCustomSnackBar('The about me can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.degreeCertificate==null){
      showCustomSnackBar('You have to upload your Degree Certificate',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.nigeriaMedicalLicense==null){
      showCustomSnackBar('You have to upload your Nigeria Medical License',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.specialistDocuments==null){
      showCustomSnackBar('You have to upload your Specialist Supporting Documents',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }
  VerificationModel doctorStep4Verified(context){
    if(this.companyOrganisationController.text.isEmpty){
      showCustomSnackBar('The Company / Organisation can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    if(this.fromController.text.isEmpty){
      showCustomSnackBar('From date can not be empty',  isError: true);
      return VerificationModel(verified: false, message: '');
    }
    return VerificationModel(verified: true, message: 'verified');
  }

  Map<String, dynamic> doctorGetStep1(speciality){
    String specialityCode = '';
    if(this.specialityCodeController.text.isNotEmpty){
      specialityCode = this.specialityCodeController.text;
      if(this.specialityCodeOtherController.text.isNotEmpty){
        specialityCode = specialityCode+','+this.specialityCodeOtherController.text;
      }
    }
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.genderController.text.isEmpty?'male':this.genderController.text.isEmpty;
    data['speciality'] = this.specialityController.text.isNotEmpty?this.specialityController.text:speciality;
    data['speciality_code'] = specialityCode;//this.specialityCodeController.text.isEmpty?'0000':this.specialityCodeController.text+if(specialityCodeOtherController.text.isEmpty)'':specialityCodeOtherController.text;
    data['language'] = this.languageSpokenController.text;
    data['mcdn'] = this.mcdnNumberController.text;
    data['otherlanguage'] = 'none';//this.otherLanguageController.text;
    data['refer'] = this.referredByController.text.isEmpty?'none':this.referredByController.text;
    return data;
  }
  Map<String, dynamic> doctorGetStep2(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.countryController.text.isEmpty?'Nigeria':this.countryController.text;
    data['state'] = this.stateController.text.isEmpty?'Abuja':this.stateController.text;
    data['refer'] = this.referredByController.text.isEmpty?'none':this.referredByController.text;
    return data;
  }
  Map<String, dynamic> doctorGetStep3(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.aboutMeController.text;
    return data;
  }
  Map<String, dynamic> doctorGetStep4(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.companyOrganisationController.text;
    data['from'] = this.fromController.text;
    data['to'] = this.toController.text.isEmpty?'Current':this.toController.text;
    data['current'] = this.iCurrentlyWorkHere?'1':'0';
    return data;
  }

  Map<String, dynamic> nurseGetStep1(speciality){
    String specialityCode = '';
    if(this.specialityCodeController.text.isNotEmpty){
      specialityCode = this.specialityCodeController.text;
      if(this.specialityCodeOtherController.text.isNotEmpty){
        specialityCode = specialityCode+','+this.specialityCodeOtherController.text;
      }
    }
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.genderController.text.isEmpty?'male':this.genderController.text.isEmpty;
    data['speciality'] = this.specialityController.text.isNotEmpty?this.specialityController.text:speciality;
    data['speciality_code'] = specialityCode;//this.specialityCodeController.text.isEmpty?'0000':this.specialityCodeController.text+if(specialityCodeOtherController.text.isEmpty)'':specialityCodeOtherController.text;
    data['language'] = this.languageSpokenController.text;
    data['mcdn'] = this.mcdnNumberController.text;
    data['otherlanguage'] = 'none';
    data['refer'] = this.referredByController.text.isEmpty?'none':this.referredByController.text;
    return data;
  }
  Map<String, dynamic> nurseGetStep2(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.countryController.text.isEmpty?'Nigeria':this.countryController.text;
    data['state'] = this.stateController.text.isEmpty?'Abuja':this.stateController.text;
    data['refer'] = this.referredByController.text.isEmpty?'none':this.referredByController.text;

    data['account_number'] = this.accountNumberController.text.isEmpty?'none':this.accountNumberController.text;
    data['account_name'] = this.accountNameController.text.isEmpty?'none':this.accountNameController.text;
    data['bank_code'] = this.bankCodeController.text.isEmpty?'none':this.bankCodeController.text;
    data['id_card'] = this.idCardController.text.isEmpty?'none':this.idCardController.text;
    return data;
  }
  Map<String, dynamic> nurseGetStep3(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.aboutMeController.text;
    return data;
  }
  Map<String, dynamic> nurseGetStep4(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.companyOrganisationController.text;
    data['from'] = this.fromController.text;
    data['to'] = this.toController.text.isEmpty?'Current':this.toController.text;
    data['current'] = this.iCurrentlyWorkHere?'1':'0';
    return data;
  }
}