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

class ReviewsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ReviewsRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getReviews(url) async {
    return await apiClient.getData(url);
  }

}
