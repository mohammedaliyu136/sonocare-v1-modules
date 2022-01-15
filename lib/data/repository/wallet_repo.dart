import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/data/model/response/account_model.dart';
import 'package:sonocare_partner2/data/model/response/profile_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:http/http.dart' as http;

class WalletRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  WalletRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getTransactions(url) async {
    return await apiClient.getData(url);
  }

  Future<Response> withDrawFunds({required String url, required String amount}) async {
    return await apiClient.postData(url, {'amount':amount});
  }

  Future<Response> updateAccount({required String url, required AccountInfoModel accountInfo}) async {
    return await apiClient.postData(url, accountInfo.toJson());
  }

}
