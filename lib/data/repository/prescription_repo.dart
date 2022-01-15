import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/data/model/response/prescription_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';

class PrescriptionRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PrescriptionRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> setPrescription(PrescriptionModel prescriptionModel, String url) async {
    return await apiClient.postData(url, prescriptionModel.toJson());
  }
}