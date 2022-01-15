import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/data/model/response/profile_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/state_model.dart';
import 'package:sonocare_partner2/data/model/response/userinfo_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/data/repository/auth_repo.dart';
import 'dart:io';

import 'package:sonocare_partner2/data/repository/country_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) {
    //_notification = authRepo.isNotificationActive();
  }

  //VerificationModelDoctor verificationModelDoctor = VerificationModelDoctor(id:1);

  bool _isLoading = false;
  bool acceptTerms = true;

  List<StateModel> states = [];
  List<String> countries = [];
  List<LGAModel> lga = [];

  bool get isLoading => _isLoading;

  UserInfoModel? userInfoModel;

  String imgUrl = "";

  String gender = "Male";

  // for login section
  String _loginErrorMessage = '';
  String _email = '';
  String _password = '';
  String _token = '';

  String accountType = '';

  get token => _token;

  String get loginErrorMessage => _loginErrorMessage;
  String get email => _email;
  String get password => _password;

  setAccountType(accountType){
    this.accountType = accountType;
    update();
  }

  setEmail(email, password){
    _email = email;
    _password = password;
  }

  setGender(gender){
    this.gender=gender;
  }

  not()async{
    update();
  }

  updateUser({firstName, lastName, otherName, address, gender, stateID, lgaID}){
    userInfoModel!.updateProfile(firstName:firstName, lastName:lastName, otherName:otherName, address:address, gender:gender, stateID:stateID, lgaID:lgaID);
    userInfoModel!.firstName=firstName;
    update();
  }

  Future<ResponseModel> login(String email, String password, String url) async {
    _isLoading = true;
    _loginErrorMessage = '';
    update();
    Response response = await authRepo.login(email: email, password: password, url: url);

    ResponseModel responseModel;
    if (response != null && response.statusCode == 200) {
      var responseBody = response.body;
      var userJsonObj = responseBody['user'];
      
      userInfoModel = UserInfoModel.fromJson(userJsonObj);
      _token = responseBody['access_token'];
      _token = "?token="+_token;
      authRepo.saveUserToken(_token);
      //saveUserDetail(userObject: userInfoModel!, token: _token);
      responseModel = ResponseModel(true, 'Login Successful');
    } else {
      _loginErrorMessage = '';
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> loginNotVerified(String email, String password, String url) async {
    _isLoading = true;
    _loginErrorMessage = '';
    update();
    Response response = await authRepo.login(email: email, password: password, url:url);

    ResponseModel responseModel;
    if (response != null && response.statusCode == 400) {
      var responseBody = response.body;
      String message = responseBody['message'];
      _token = responseBody['token'];
      responseModel = ResponseModel(true, 'Login Successful');
    } else {
      _loginErrorMessage = '';
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  String _registrationErrorMessage = '';

  String get registrationErrorMessage => _registrationErrorMessage;

  updateRegistrationErrorMessage(String message) {
    _registrationErrorMessage = message;
    update();
  }

  Future<ResponseModel> registration({required String accountType, DoctorSignUpBody? doctorSignUpBody, NurseSignUpBody? nurseSignUpBody,}) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    update();

    Response response;

    /*
    selectedAccount =='doctor'?const DoctorVerificationScreen()
          :selectedAccount =='nurse'?const NurseVerificationScreen()
          :selectedAccount =='ambulance'?const AmbulanceVerificationScreen()
          :selectedAccount =='lab'?const LabVerificationScreen()
          :selectedAccount =='logistic'?const LogisticVerificationScreen()
          :selectedAccount =='pharmacy'?const PharmacyVerificationScreen():Container();
     */
    if(accountType=='doctor'){
      response = await authRepo.doctorRegistration(doctorSignUpBody!);
    }else if(accountType == 'nurse'){
      response = await authRepo.nurseRegistration(nurseSignUpBody!);
    }else{
      response = await authRepo.nurseRegistration(nurseSignUpBody!);
    }
    ResponseModel responseModel;
    if (response != null && response.statusCode == 201) {
      var responseBody = response.body;
      _email = responseBody['user']['email'];
      responseModel = ResponseModel(true, 'Registration Successful');
    } else {
      responseModel = ResponseModel(false, '');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> email_verification({email_verification_code, email, url}) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    update();
    Response response = await authRepo.emailVerification(email_verification_code: email_verification_code, email: email, url: url);
    ResponseModel responseModel;
    if (response != null && response.statusCode == 200) {
      var responseBody = response.body;
      responseModel = ResponseModel(true, 'Email Verification Successful');
    } else {
      responseModel = ResponseModel(false, 'Email Verification Failed');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> uploadProfileImage(File profileImage, _token)async{
    _isLoading = true;
    _loginErrorMessage = '';
    update();
    Response response = await authRepo.uploadProfileImage(profileImage, _token);
    imgUrl = response.body['image'];
    userInfoModel!.image = response.body['image'];
    update();

    ResponseModel responseModel;
    if (response != null && response.statusCode == 200) {
      responseModel = ResponseModel(true, 'Updated Profile Image Successfully');
    } else {
      responseModel = ResponseModel(false, 'Something went wrong.');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updateUserInfo(ProfileDoctorModel profileDoctorModel, url) async {
    _isLoading = true;
    update();
    print('-------------------------');
    print('-------------------------');
    print(profileDoctorModel.toJson());
    String tok = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc29ub2NhcmUuYXBwXC9hcGlcL251cnNlbG9naW4iLCJpYXQiOjE2NDE0MDY0ODQsImV4cCI6MjI0MTQwNjQ4NCwibmJmIjoxNjQxNDA2NDg0LCJqdGkiOiJQaWxaejRDeDlpSWNsY29oIiwic3ViIjo1NCwicHJ2IjoiY2ExMmUyYTU0YWUwNjE2NjU2MTliODRkNGFlZDBiNjZhNjQ0MWEyOCJ9.nBfGeMlPtf7lsegy3ioobAOqlSg1P7XsqSAuJVSff3k';
    ResponseModel _responseModel;
    Response response = await authRepo.updateProfile(profileDoctorModel, url);
    if (response != null && response.statusCode == 200) {

      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    _isLoading = false;
    update();
    return _responseModel;
  }

  LGAModel selectedLGA = LGAModel(name: 'Choose LGA', id: -1);
  StateModel selectedState = StateModel(name: 'Choose State', id: -1);
  bool loadingStates = false;
  Future<List<StateModel>> getStates(BuildContext context,) async {
    countries = getCountries()!;
    loadingStates = true;
    ResponseModel _responseModel;
    Response response = await authRepo.getStates();
    if (response != null && response.statusCode == 200) {
      var data = response.body;
      for( var i = 0 ; i < data['getAllState'].length; i++ ) {
        states.add(StateModel.fromJson(data['getAllState'][i]));
      }
      print('states: sizes');
      print(states.length);
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    loadingStates = true;
    return states;
  }

  startVerification(doctorID){
    /*
    if(this.verificationModelDoctor!=null){
      this.verificationModelDoctor = VerificationModelDoctor(id:doctorID);
    }
    */
  }
  verifyDoctor(){
    /*
    print('id: ${this.verificationModelDoctor.id}');
    print('gender: ${this.verificationModelDoctor.gender}');
    print('Specialty Code: ${this.verificationModelDoctor.specialityCode}');
    print('country: ${this.verificationModelDoctor.country}');
    print('referedBy: ${this.verificationModelDoctor.referedBy}');
    print('degreeCert: ${this.verificationModelDoctor.degreeCert}');
    print('medicalLicence: ${this.verificationModelDoctor.medicalLicence}');
    print('backingInformation: ${this.verificationModelDoctor.backingInformation}');
    print('companyOrganisation: ${this.verificationModelDoctor.companyOrganisation}');
    print('workingFrom: ${this.verificationModelDoctor.workingFrom}');
    print('workingTo: ${this.verificationModelDoctor.workingTo}');
    */
  }


  bool loadingNurseServices = false;
  List<NurseService> nurseServicesList = [NurseService(title: '', id: '')];
  Future<ResponseModel> getNurseService() async {
    loadingNurseServices = true;
    nurseServicesList = [NurseService(title: '', id: '')];
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.getNurseService();
    if (response.statusCode == 200) {
      var data = response.body;
      print('--------------');
      print('--------------');
      print('--------------');
      print(data);
      nurseServicesList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        nurseServicesList.add(NurseService.fromJson(data['data'][i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    loadingNurseServices = false;
    update();
    return _responseModel;
  }

  bool loadingServicePreferences = false;
  List<ServicePref> servicePreferencesList = [ServicePref(type: '',id: '')];
  Future<ResponseModel> getServicePreferences() async {
    loadingServicePreferences = true;
    servicePreferencesList = [ServicePref(type: '',id: '')];
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.getServicePreferences();
    if (response != null && response.statusCode == 200) {
      var data = response.body;
      servicePreferencesList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        servicePreferencesList.add(ServicePref.fromJson(data['data'][i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    loadingServicePreferences = false;
    update();
    return _responseModel;
  }

  Future<ResponseModel> setServicePreference(int serviceID, String serviceFee) async {

    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await authRepo.setServiceFee(serviceID, serviceFee);
    _isLoading = false;
    if (response.statusCode == 200) {

      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    update();
    return _responseModel;
  }


  bool loadingNurseType = false;
  List<NurseType> nurseTypeList = [NurseType(id: '', title: '')];
  Future<ResponseModel> getNurseType() async {
    loadingNurseType = true;
    nurseTypeList = [NurseType(id: '', title: '')];
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.getNurseType();
    if (response != null && response.statusCode == 200) {
      //var data = response.body;
      var data = response.body;
      nurseTypeList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        nurseTypeList.add(NurseType.fromJson(data['data'][i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    loadingNurseType = false;
    update();
    return _responseModel;
  }
  
  //-----------------------------------------doctor start

  bool loadingDoctorType = false;
  List<DoctorType> doctorTypeList = [DoctorType(id: '', title: '')];
  Future<ResponseModel> getDoctorType() async {
    loadingDoctorType = true;
    doctorTypeList = [DoctorType(id: '', title: '')];
    update();
    
    ResponseModel _responseModel;
    Response response = await authRepo.getDoctorType();
    if (response != null && response.statusCode == 200) {
      print('-----------');
      print(response.body);
      var data = response.body;//response.body;
      doctorTypeList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        doctorTypeList.add(DoctorType.fromJson(data['data'][i]));
      }
      print(doctorTypeList);
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    loadingDoctorType = false;
    update();
    return _responseModel;
  }

  bool loadingConsultationType = false;
  List<ConsultationType> consultationTypeList = [ConsultationType(id: '', title: '')];
  Future<ResponseModel> getConsultationType() async {
    loadingConsultationType = true;
    consultationTypeList = [ConsultationType(id: '', title: '')];
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.getConsultationType();
    if (response.statusCode == 200) {
      var data = response.body;
      consultationTypeList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        consultationTypeList.add(ConsultationType.fromJson(data['data'][i]));
      }
      print(consultationTypeList);
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    loadingConsultationType = false;
    update();
    return _responseModel;
  }

  bool loadingConsultationFee = false;
  List<ConsultationFee> consultationFeeList = [ConsultationFee(id: '', servicesType: '', price: '')];
  Future<ResponseModel> getConsultationFee() async {
    loadingConsultationFee = true;
    consultationFeeList = [ConsultationFee(id: '', servicesType: '', price: '')];
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.getConsultationFee();
    if (response != null && response.statusCode == 200) {
      var data = response.body;
      consultationFeeList = [];
      for( var i = 0 ; i < data['data'].length; i++ ) {
        print(data['data']);
        consultationFeeList.add(ConsultationFee.fromJson(data['data'][i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    loadingConsultationFee = false;
    update();
    return _responseModel;
  }

  Future<ResponseModel> setConsultationFee(consultationFee) async {
    loadingConsultationFee = true;
    update();

    ResponseModel _responseModel;
    Response response = await authRepo.setConsultationFee(consultationFee: consultationFee);
    if (response != null && response.statusCode == 200) {
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    loadingConsultationFee = false;
    update();
    return _responseModel;
  }
  //-----------------------------------------doctor end

  saveUserDetail({required UserInfoModel userObject, required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userObjectSTR = json.encode(userObject);
    await prefs.setString('user_object', userObjectSTR);
    await prefs.setString('user_login_type', 'nurse');
    await prefs.setString('user_token', token);

    /*
    FirebaseMessaging.instance.getToken().then((value){
      CollectionReference fcmTokens = FirebaseFirestore.instance.collection('fcm_tokens');
      fcmTokens.add({
        'full_name': userObject.firstName+' '+userObject.lastName, // John Doe
        'token': value, // Stokes and Sons
      });
    });
    */
  }
  getUserDetail({context, accountType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userObjectSTR = await prefs.getString('user_object')??'';
    this.userInfoModel = UserInfoModel.fromJson(json.decode(userObjectSTR));
    String tokenSTR = await prefs.getString('user_token')??'';
    this._token = tokenSTR;
    update();

    if(tokenSTR.length>1){
      //DashboardNurseScreen
      Get.toNamed('/');
    }else{
      Get.toNamed('/');
    }
  }
  
  Future<ResponseModel> checkEmail(String email, String url) async {
    _isLoading = true;
    _loginErrorMessage = '';
    update();
    Response response = await authRepo.checkEmail(email: email, url: url);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      var responseBody = response.body;
      String message = responseBody['message'];
      responseModel = ResponseModel(true, message);
    } else {
      responseModel = ResponseModel(false, 'error');
    }
    _isLoading = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> resetPassword(String email, String url, String otp, String password) async {
    _isLoading = true;
    _loginErrorMessage = '';
    update();
    Response response = await authRepo.resetPassword(email: email, url: url, otp: otp, password: password);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      var responseBody = response.body;
      String message = responseBody['message'];
      responseModel = ResponseModel(true, message);
    } else {
      responseModel = ResponseModel(false, '');
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_object', '');
    await prefs.setString('user_login_type', '');
    await prefs.setString('user_token', '');
  }
}