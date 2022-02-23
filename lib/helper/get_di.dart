import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/ambulance_controller.dart';
import 'package:sonocare_partner2/controller/app_controller.dart';
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/delivery_controller.dart';
import 'package:sonocare_partner2/controller/hospital_controller.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/localization_controller.dart';
import 'package:sonocare_partner2/controller/map_controller.dart';
import 'package:sonocare_partner2/controller/onboarding_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/controller/prescription_controller.dart';
import 'package:sonocare_partner2/controller/profile_form_controller.dart';
import 'package:sonocare_partner2/controller/reviews_controller.dart';
import 'package:sonocare_partner2/controller/splash_controller.dart';
import 'package:sonocare_partner2/controller/theme_controller.dart';
import 'package:sonocare_partner2/controller/verification_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/controller/wallet_controller.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/data/model/response/language_model.dart';
import 'package:sonocare_partner2/data/repository/ambulance_repo.dart';
import 'package:sonocare_partner2/data/repository/appointment_repo.dart';
import 'package:sonocare_partner2/data/repository/auth_repo.dart';
import 'package:sonocare_partner2/data/repository/delivery_repo.dart';
import 'package:sonocare_partner2/data/repository/hospital_repo.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';
import 'package:sonocare_partner2/data/repository/language_repo.dart';
import 'package:sonocare_partner2/data/repository/map_repo.dart';
import 'package:sonocare_partner2/data/repository/onboarding_repo.dart';
import 'package:sonocare_partner2/data/repository/pharmacy_repo.dart';
import 'package:sonocare_partner2/data/repository/prescription_repo.dart';
import 'package:sonocare_partner2/data/repository/review_repo.dart';
import 'package:sonocare_partner2/data/repository/splash_repo.dart';
import 'package:sonocare_partner2/data/repository/verification_repo.dart';
import 'package:sonocare_partner2/data/repository/wallet_repo.dart';
import 'package:sonocare_partner2/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => LanguageRepo());
  Get.lazyPut(() => OnBoardingRepo());
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => VerificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LabRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => DeliveryRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AmbulanceRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PharmacyRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PharmacyRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ReviewsRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => WalletRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AppointmentRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => MapRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PrescriptionRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => HospitalRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AppController());
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => OnBoardingController(onboardingRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => VerificationController(verificationRepo: Get.find()));
  Get.lazyPut(() => LabController(labRepo: Get.find()));
  Get.lazyPut(() => DeliveryController(deliveryRepo: Get.find()));
  Get.lazyPut(() => AmbulanceController(ambulanceRepo: Get.find()));
  Get.lazyPut(() => PharmacyController(pharmacyRepo: Get.find()));
  Get.lazyPut(() => VerificationFormController());
  Get.lazyPut(() => ProfileFormController());
  Get.lazyPut(() => ReviewsController(reviewsRepo: Get.find()));
  Get.lazyPut(() => WalletController(walletRepo: Get.find()));
  Get.lazyPut(() => AppointmentController(appointmentRepo: Get.find()));
  Get.lazyPut(() => MapController(mapRepo: Get.find()));
  Get.lazyPut(() => PrescriptionController(prescriptionRepo: Get.find()));
  Get.lazyPut(() => HospitalController(hospitalRepo: Get.find(),));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}
