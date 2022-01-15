import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';
import 'package:sonocare_partner2/data/api/api_checker.dart';
import 'package:sonocare_partner2/data/repository/splash_repo.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  //ConfigModel _configModel;
  DateTime _currentTime = DateTime.now();
  bool _firstTimeConnectionCheck = true;

  //ConfigModel get configModel => _configModel;
  DateTime get currentTime => DateTime.now();
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<bool> getConfigData() async {
    bool _isSuccess = true;
    update();
    return _isSuccess;
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  bool showIntro() {
    return splashRepo.showIntro();
  }

  void disableIntro() {
    splashRepo.disableIntro();
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}
