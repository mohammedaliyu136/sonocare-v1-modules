import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/account_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/transaction_model.dart';
import 'package:sonocare_partner2/data/repository/wallet_repo.dart';

class WalletController  extends GetxController implements GetxService {
  final WalletRepo walletRepo;
  WalletController({required this.walletRepo}) {
    //_notification = authRepo.isNotificationActive();
  }
  List<TransactionModel> transactions = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> getTransactions(String url) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await walletRepo.getTransactions(url);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      transactions = [];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        transactions.add(TransactionModel.fromJson(responseBody[i]));
      }
      _responseModel = ResponseModel(true, 'success');
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, "_errorMessage");
    }
    _responseModel = ResponseModel(false, 'error');
    _isLoading = false;
    update();
    return _responseModel;
  }

  Future<ResponseModel> setAccount(AccountInfoModel accountInfoModel, String url) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await walletRepo.updateAccount(accountInfo: accountInfoModel, url:url);
    if (response.statusCode == 200) {
      String responseBody = response.body['message'];
      _responseModel = ResponseModel(true, responseBody);
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, 'error');
      _isLoading = false;
      update();
    }
    return _responseModel;
  }

  Future<ResponseModel> withDrawFunds(String amount, String url) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await walletRepo.withDrawFunds(amount: amount, url:url);
    if (response.statusCode == 200) {
      String responseMessage = response.body['message'];
      var responseBody = response.body['data'];
      transactions = [];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        transactions.add(TransactionModel.fromJson(responseBody[i]));
      }
      _responseModel = ResponseModel(true, responseMessage);
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, 'error');
      _isLoading = false;
      update();
    }
    return _responseModel;
  }
}