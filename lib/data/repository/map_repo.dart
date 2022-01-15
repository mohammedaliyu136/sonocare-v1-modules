import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/util/app_constants.dart';

class MapRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  MapRepo({required this.apiClient, required this.sharedPreferences});

}