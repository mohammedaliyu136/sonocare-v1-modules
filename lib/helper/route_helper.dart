import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/view/base/map/map_screen.dart';
import 'package:sonocare_partner2/view/screens/ambulance/accept_delivery_request/accept_delivery_request.dart';
import 'package:sonocare_partner2/view/screens/ambulance/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/ambulance/going_to_location/delivered_screen.dart';
import 'package:sonocare_partner2/view/screens/ambulance/going_to_location/going_to_location_screen.dart';
import 'package:sonocare_partner2/view/screens/ambulance/requests/request_screen.dart';
import 'package:sonocare_partner2/view/screens/auth/forget_password.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_in_screen.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_up_screen.dart';
import 'package:sonocare_partner2/view/screens/auth/widget/select_account_type.dart';
import 'package:sonocare_partner2/view/screens/delivery/accept_delivery_request/accept_delivery_request.dart';
import 'package:sonocare_partner2/view/screens/delivery/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/delivery/going_to_location/delivered_screen.dart';
import 'package:sonocare_partner2/view/screens/delivery/going_to_location/going_to_location_screen.dart';
import 'package:sonocare_partner2/view/screens/delivery/request/request_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/hospital/accept_hospital_request/accept_hospital_request.dart';
import 'package:sonocare_partner2/view/screens/hospital/accept_hospital_request/hospital_request_completed.dart';
import 'package:sonocare_partner2/view/screens/hospital/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/hospital/request/request.dart';
import 'package:sonocare_partner2/view/screens/hospital/service/service.dart';
import 'package:sonocare_partner2/view/screens/hospital/service/service_edit.dart';
import 'package:sonocare_partner2/view/screens/lab/accept_lab_request/accept_lab_request.dart';
import 'package:sonocare_partner2/view/screens/lab/category/lab_category.dart';
import 'package:sonocare_partner2/view/screens/lab/category/lab_category_edit.dart';
import 'package:sonocare_partner2/view/screens/lab/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/lab/lab_request/lab_request_screen.dart';
import 'package:sonocare_partner2/view/screens/lab/medical_report/medical_report_screen.dart';
import 'package:sonocare_partner2/view/screens/lab/test/lab_test.dart';
import 'package:sonocare_partner2/view/screens/lab/test/lab_test_edit.dart';
import 'package:sonocare_partner2/view/screens/message/chat_list.dart';
import 'package:sonocare_partner2/view/screens/nurse/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/nurse/service_preference/service_reference_screen.dart';
import 'package:sonocare_partner2/view/screens/otp/otp_screen.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/accept_pharmacy_request/accept_pharmacy_request.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/accept_pharmacy_request/pharmacy_request_completed.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/category/pharmacy_category.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/category/pharmacy_category_edit.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/dashboard/dashboard_screen.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/product/product.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/product/product_edit.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/request/request.dart';
import 'package:sonocare_partner2/view/screens/profile_setup/profile_setup.dart';
import 'package:sonocare_partner2/view/screens/reviews/reviews.dart';
import 'package:sonocare_partner2/view/screens/settings/reset_password.dart';
import 'package:sonocare_partner2/view/screens/settings/settings_screen.dart';
import 'package:sonocare_partner2/view/screens/splash/splash_screen.dart';
import 'package:sonocare_partner2/view/screens/verification/verification_screen.dart';
import 'package:sonocare_partner2/view/screens/wallet/bank_account.dart';
import 'package:sonocare_partner2/view/screens/wallet/wallet_screen.dart';
import 'package:sonocare_partner2/view/screens/wallet/wallet_settings.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String signIN = '/sign-in';
  static const String selectAccountType = '/account/type';
  static const String signUP = '/sign-up';
  static const String forgetPassword = '/forget-password';
  static const String otp = '/otp';
  static const String verification = '/verification';
  static const String labDashboard = '/lab/dashboard';
  static const String labRequest = '/lab/request/list';
  static const String acceptLabRequest = '/lab/request/accept';
  static const String labCategories = '/lab/categories';
  static const String labCategoryEdit = '/lab/category/edit';
  static const String labTests = '/lab/tests';
  static const String labTestEdit = '/lab/tests/edit';
  static const String labMedicalReport = '/lab/medical/report';

  static const String pharmacyDashboard = '/pharmacy/dashboard';
  static const String pharmacyRequestList = '/pharmacy/request/list';
  static const String acceptPharmacyRequest = '/pharmacy/request/accept';
  static const String pharmacyRequestFinished = '/pharmacy/request/completed';
  static const String pharmacyProductAdd = '/pharmacy/product/edit';
  static const String pharmacyProductList = '/pharmacy/product/list';
  static const String pharmacyCategoryAdd = '/pharmacy/category/edit';
  static const String pharmacyCategoryList = '/pharmacy/category/list';

  static const String hospitalDashboard = '/hospital/dashboard';
  static const String hospitalRequestList = '/hospital/request/list';
  static const String acceptHospitalRequest = '/hospital/request/accept';
  static const String hospitalRequestFinished = '/hospital/request/completed';
  static const String hospitalProductAdd = '/hospital/service/edit';
  static const String hospitalProductList = '/hospital/service/list';

  static const String deliveryRequestList = '/delivery/request/list';
  static const String deliveryDashboard = '/delivery/dashboard';
  static const String acceptDeliveryRequest = '/delivery/request/accept';
  static const String goingToDeliveryRequest = '/delivery/request/going';
  static const String deliveryRequestDelivered = '/delivery/request/delivered';

  static const String ambulanceDashboard = '/ambulance/dashboard';
  static const String ambulanceRequestList = '/ambulance/request/list';
  static const String acceptAmbulanceRequest = '/ambulance/request/accept';
  static const String goingToAmbulanceRequest = '/ambulance/request/going';
  static const String deliveryAmbulanceArrived = '/ambulance/request/completed';

  static const String nurseDashboard = '/nurse/dashboard';
  static const String nurseUpdateProfile = '/nurse/profile/update';
  static const String updateProfile = '/profile/update';

  static const String wallet = '/wallet';
  static const String walletSetting = '/wallet/setting';
  static const String walletBank = '/wallet/bank';

  static const String review = '/reviews';
  static const String doctorDashboard = '/doctor/dashboard';

  static const String messageList = '/message/list';

  static const String settings = '/settings';

  static const String nurseServicePrefList = '/nurse/service/preference';

  static String getInitialRoute() => '$initial';
  static String getSplashRoute() => '$splash';
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getSignINRoute() => '$signIN';
  static String getSelectAccountTypeRoute() => '$selectAccountType';
  static String getSignUPRoute() => '$signUP';
  static String getForgetPasswordRoute() => '$forgetPassword';
  static String getOTPRoute() => '$otp';
  static String getVerificationRoute() => '$verification';
  static String getLabDashboardRoute() => '$labDashboard';
  static String getLabRequestsRoute() => '$labRequest';
  static String getAcceptLabRequestRoute() => '$acceptLabRequest';
  static String getLabCategoriesRoute() => '$labCategories';
  static String getLabTestsRoute() => '$labTests';
  static String getLabTestEditRoute() => '$labTestEdit';
  static String getLabCategoryEditRoute() => '$labCategoryEdit';
  static String getLabMedicalReportRoute() => '$labMedicalReport';
  static String getGoingToDeliveryRequestRoute() => '$goingToDeliveryRequest';

  static String getPharmacyDashboardRoute() => '$pharmacyDashboard';

  static String getDeliveryDashboardRoute() => '$deliveryDashboard';
  static String getAcceptDeliveryRequestRoute() => '$acceptDeliveryRequest';
  static String getDeliveryRequestDeliveredRoute() => '$deliveryRequestDelivered';

  static String getAmbulanceDashboardRoute() => '$ambulanceDashboard';
  static String getAcceptAmbulanceRequestRoute() => '$acceptAmbulanceRequest';
  static String getDeliveryRequestAmbulanceRoute() => '$deliveryRequestDelivered';

  static String getPharmacyProductListRoute() => '$pharmacyProductList';
  static String getPharmacyProductAddRoute() => '$pharmacyProductAdd';
  static String getPharmacyCategoryListRoute() => '$pharmacyCategoryList';
  static String getPharmacyCategoryAddRoute() => '$pharmacyCategoryAdd';
  static String getPharmacyRequestFinishedRoute() => '$pharmacyRequestFinished';

  static String getNurseDashboardRoute() => '$nurseDashboard';
  static String getUpdateProfileRoute() => '$updateProfile';

  static String getWalletRoute() => '$wallet';
  static String getWalletSettingRoute() => '$walletSetting';
  static String getWalletBankRoute() => '$walletBank';

  static String getReviewRoute() => '$review';
  static String getDoctorDashboardRoute() => '$doctorDashboard';

  static String getMessageListRoute() => '$messageList';
  static String getSettingsRoute() => '$settings';

  static String getNurseServicePrefListRoute() => '$nurseServicePrefList';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(SplashScreen())),
    //GetPage(name: initial, page: () => getRoute(MapPage(source_location: const LatLng(9.19497455726949, 12.461157348341885), destination_location: const LatLng(9.21406397684134, 12.488736896453696),))),
    //GetPage(name: splash, page: () => getRoute(MapPage(source_location: const LatLng(9.19497455726949, 12.461157348341885), destination_location: const LatLng(9.21406397684134, 12.488736896453696),))),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: signIN, page: () => getRoute(LoginScreen())),
    GetPage(name: signUP, page: () => getRoute(const RegisterScreen())),
    GetPage(name: selectAccountType, page: () => getRoute(const SelectAccountTypeScreen())),
    GetPage(name: forgetPassword, page: () => getRoute(const ResetPasswordScreen())),
    GetPage(name: otp, page: () => getRoute(const OTPScreen())),
    GetPage(name: verification, page: () => getRoute(const VerificationScreen())),
    GetPage(name: labDashboard, page: () => getRoute(const DashboardLabScreen())),
    GetPage(name: labRequest, page: () => getRoute(const LabRequestsScreen())),
    GetPage(name: acceptLabRequest, page: () => getRoute(const AcceptLabRequestScreen())),
    GetPage(name: labCategories, page: () => getRoute(const LabCategoryScreen())),
    GetPage(name: labTests, page: () => getRoute(LabTestScreen())),
    GetPage(name: labTestEdit, page: () => getRoute(LabTestEditScreen())),
    GetPage(name: labCategoryEdit, page: () => getRoute(const LabCategoryEditScreen())),
    GetPage(name: labMedicalReport, page: () => getRoute(MedicalReportScreen())),

    GetPage(name: pharmacyDashboard, page: () => getRoute(const PharmacyDashboardScreen())),
    GetPage(name: pharmacyRequestList, page: () => getRoute(const PharmacyRequestListScreen())),
    GetPage(name: pharmacyCategoryList, page: () => getRoute(const PharmacyCategoryScreen())),
    GetPage(name: pharmacyCategoryAdd, page: () => getRoute(const PharmacyCategoryEditScreen())),
    GetPage(name: pharmacyProductList, page: () => getRoute(const ProductScreen())),
    GetPage(name: pharmacyProductAdd, page: () => getRoute(const PharmacyProductEditScreen())),
    GetPage(name: acceptPharmacyRequest, page: () => getRoute(const AcceptPharmacyRequestScreen())),
    GetPage(name: pharmacyRequestFinished, page: () => getRoute(const PharmacyRequestCompletedScreen())),

    GetPage(name: hospitalDashboard, page: () => getRoute(const HospitalDashboardScreen())),
    GetPage(name: hospitalRequestList, page: () => getRoute(const HospitalRequestListScreen())),
    GetPage(name: hospitalProductList, page: () => getRoute(const ServiceScreen())),
    GetPage(name: hospitalProductAdd, page: () => getRoute(const HospitalServiceEditScreen())),
    GetPage(name: acceptHospitalRequest, page: () => getRoute(const AcceptHospitalRequestScreen())),
    GetPage(name: hospitalRequestFinished, page: () => getRoute(const HospitalRequestCompletedScreen())),

    GetPage(name: deliveryDashboard, page: () => getRoute(const DeliveryDashboardScreen())),
    GetPage(name: deliveryRequestList, page: () => getRoute(const DeliveryRequestScreen())),
    GetPage(name: acceptDeliveryRequest, page: () => getRoute(const AcceptDeliveryRequestScreen())),
    GetPage(name: goingToDeliveryRequest, page: () => getRoute(const GoingToLocationScreen())),
    GetPage(name: deliveryRequestDelivered, page: () => getRoute(const DeliveredScreen())),

    GetPage(name: ambulanceDashboard, page: () => getRoute(const DashboardAmbulanceScreen())),
    GetPage(name: ambulanceRequestList, page: () => getRoute(const RequestScreen())),
    GetPage(name: acceptAmbulanceRequest, page: () => getRoute(const AcceptAmbulanceRequestScreen())),
    GetPage(name: goingToAmbulanceRequest, page: () => getRoute(const GoingToLocationAmbulanceScreen())),
    GetPage(name: deliveryAmbulanceArrived, page: () => getRoute(const AmbulanceArrivedSuccessfully())),

    GetPage(name: nurseDashboard, page: () => getRoute(const DashboardNurseScreen())),
    GetPage(name: updateProfile, page: () => getRoute(ProfileSetUPNurseScreen())),

    GetPage(name: wallet, page: () => getRoute(const WalletScreen())),
    GetPage(name: walletSetting, page: () => getRoute(const WalletSettings())),
    GetPage(name: walletBank, page: () => getRoute(const BankAccountScreen())),

    GetPage(name: review, page: () => getRoute(const ReviewsScreen())),
    GetPage(name: doctorDashboard, page: () => getRoute(const DashboardDoctorScreen())),

    GetPage(name: messageList, page: () => getRoute(ChatListScreen())),
    GetPage(name: settings, page: () => getRoute(const SettingsScreen())),

    GetPage(name: nurseServicePrefList, page: () => getRoute(const ServicePreferenceNurseScreen())),
    ];

  static getRoute(Widget navigateTo){
    return navigateTo;
  }
}