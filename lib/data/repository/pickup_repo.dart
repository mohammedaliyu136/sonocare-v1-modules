import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:http/http.dart' as http;

class PickupRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  PickupRepo({required this.sharedPreferences, required this.apiClient});

}
