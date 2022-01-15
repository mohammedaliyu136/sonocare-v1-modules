import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:http/http.dart' as http;


class VerificationRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  VerificationRepo({required this.sharedPreferences, required this.apiClient});

  Future<http.StreamedResponse> personalInformationVerification(Map<String, dynamic> step, XFile? passport, String token) async {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}/api/dstep1verification?token=$token'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    File _file = File(passport!.path);
    request.files.add(http.MultipartFile('passport', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));

    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'gender': step['gender'].toLowerCase(),
      'speciality': step['speciality'],
      'speciality_code': step['speciality_code'],
      'language': step['language'],
      'mcdn': step['mcdn'],
      'otherlanguage': step['otherlanguage'],
      'refer': step['refer'],
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }
  Future<http.StreamedResponse> businessInformationVerification(Map<String, dynamic> step, XFile? idCard, String token) async {

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}/api/dstep2verification?token=$token'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    File _file = File(idCard!.path);
    request.files.add(http.MultipartFile('id_card', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    Map<String, String> _fields = Map();

    _fields.addAll(<String, String>{
      'country': step['country'],
      'state': step['state'],
      'refer': step['refer'],
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }
  Future<http.StreamedResponse> medicalInformationVerification(Map<String, dynamic> step, XFile? degreeCertificate, XFile? nigerianMedicalCertificate, XFile? specialistDoc, String token) async {

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}/api/dstep3verification?token=$token'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    File _file = File(degreeCertificate!.path);
    request.files.add(http.MultipartFile('deg_cert', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    _file = File(nigerianMedicalCertificate!.path);
    request.files.add(http.MultipartFile('med_license', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    _file = File(specialistDoc!.path);
    request.files.add(http.MultipartFile('backing_info', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'about': step['about']
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }
  Future<http.StreamedResponse> professionalInformationVerification(Map<String, dynamic> step, String token) async {

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}/api/dstep4verification?token=$token'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'company': step['company'],
      'from': step['from'],
      'to': step['to'],
      'current': step['current'],
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }

}
