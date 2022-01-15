import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:http/http.dart' as http;


class LabRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LabRepo({required this.sharedPreferences, required this.apiClient});

  Future<Response> getLabCategories({required String url}) async {
    return await apiClient.getData(url);
  }

  Future<Response> getLabTest({required String url, labCategory}) async {
    return await apiClient.postData(url, {'category_id':labCategory});
  }

}
