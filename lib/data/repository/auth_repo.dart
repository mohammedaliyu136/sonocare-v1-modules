import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/data/model/response/profile_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> doctorRegistration(DoctorSignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.DOCTOR_REGISTER_URI, signUpBody.toJson());
  }
  Future<Response> nurseRegistration(NurseSignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.NURSE_REGISTER_URI, signUpBody.toJson());
  }
  Future<Response> labRegistration(LabSignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.LAB_REGISTER_URI, signUpBody.toJson());
  }
  Future<Response> logisticRegistration(LogisticSignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.LOGISTIC_REGISTER_URI, signUpBody.toJson());
  }
  Future<Response> pharmacyRegistration(PharmacySignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.PHARMACY_REGISTER_URI, signUpBody.toJson());
  }
  Future<Response> ambulanceRegistration(AmbulanceSignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.AMBULANCE_REGISTER_URI, signUpBody.toJson());
  }

  Future<Response> login({required String email, required String password, required String url}) async {
    return await apiClient.postData(url, {"email": email, "password": password});
  }
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    //apiClient.updateHeader(token, null);
    //return await sharedPreferences.setString(AppConstants.TOKEN, token);
    return true;
  }
  Future<Response> emailVerification({required String email, required String email_verification_code, required String url}) async {
    return await apiClient.postData(url, {"email": email, "email_verification_code": email_verification_code});
  }

  Future<Response> getStates() async {
    return await apiClient.getData(AppConstants.STATE_LIST_URI,);
  }

  uploadProfileImage(File? profileImage, String token) async {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}/api/nuseupdateimage?token=${token}'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    File _file = File(profileImage!.path);
    request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      //'about': step['about']
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    print("response.statusCode");
    print(response.statusCode);
    var response12 = await http.Response.fromStream(response);
    print(response12.body);
    return response12;
  }

  Future<Response> updateProfile(ProfileDoctorModel profileDoctorModel, url) async {
    return await apiClient.postData(url,
          profileDoctorModel.toJson()
      );
  }

  Future<Response> checkEmail({required String email, required String url}) async {
    return await apiClient.postData(url, {"email": email});
  }

  Future<Response> resetPassword({required String email, required String url, required String otp, required String password}) async {
    return await apiClient.postData(url, {"otp":otp, "email":email, "password":password});
  }

  Future<Response> getNurseService() async {
    return await apiClient.getData(AppConstants.NURSE_SERVICE_LIST_URI,);
  }

  Future<Response> getServicePreferences() async {
    return await apiClient.getData(AppConstants.SERVICE_PREFERENCE_LIST_URI,);
  }

  Future<Response> setServiceFee(serviceID, serviceFee) async {
    return await apiClient.postData(AppConstants.SERVICE_PREFERENCE_LIST_URI,{'fee':serviceFee});
  }

  Future<Response> getNurseType() async {
    return await apiClient.getData(AppConstants.NURSE_TYPE_LIST_URI,);
  }

  Future<Response> getDoctorType() async {
    return await apiClient.getData(AppConstants.DOCTOR_TYPE_LIST_URI,);
  }

  Future<Response> getConsultationType() async {
    return await apiClient.getData(AppConstants.CONSULTATION_TYPE_LIST_URI,);
  }

  Future<Response> getConsultationFee() async {
    return await apiClient.getData(AppConstants.CONSULTATION_FEE_URI,);
  }

  Future<Response> setConsultationFee({required ConsultationFee consultationFee}) async {
    return await apiClient.postData(AppConstants.CONSULTATION_SET_FEE_URI,
        {
          "consultation_fee":consultationFee.price,
          "type":consultationFee.servicesType
        }
    );
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  bool clearSharedData() {
    if(!GetPlatform.isWeb) {
      //FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    }
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.setStringList(AppConstants.CART_LIST, []);
    sharedPreferences.remove(AppConstants.USER_ADDRESS);
    //apiClient.token = null;
    //apiClient.updateHeader(null, null);
    return true;
  }

  // for  Remember Email
  Future<void> saveUserNumberAndPassword(String number, String password, String countryCode) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NUMBER, number);
      await sharedPreferences.setString(AppConstants.USER_COUNTRY_CODE, countryCode);
    } catch (e) {
      throw e;
    }
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.USER_NUMBER) ?? "";
  }

  String getUserCountryCode() {
    return sharedPreferences.getString(AppConstants.USER_COUNTRY_CODE) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.NOTIFICATION) ?? true;
  }

  void setNotificationActive(bool isActive) {
    if(isActive) {
      //updateToken();
    }else {
      if(!GetPlatform.isWeb) {
        //FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
        if(isLoggedIn()) {
          //FirebaseMessaging.instance.unsubscribeFromTopic('zone_${Get.find<LocationController>().getUserAddress().zoneId}_customer');
        }
      }
    }
    sharedPreferences.setBool(AppConstants.NOTIFICATION, isActive);
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    await sharedPreferences.remove(AppConstants.USER_COUNTRY_CODE);
    return await sharedPreferences.remove(AppConstants.USER_NUMBER);
  }
}
