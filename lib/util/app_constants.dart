import 'package:sonocare_partner2/data/model/response/language_model.dart';
import 'package:sonocare_partner2/util/images.dart';

class AppConstants {
  static const String APP_NAME = 'SonoCare Partner';
  static const int APP_VERSION = 1;
  static const String MAP_API_KEY = 'AIzaSyBAIpR0sqDMtDAwKAc0ilVX5MDRLTqKwaI';

  static const String BASE_URL = 'https://sonocare.app';
  static const String DOCTOR_REGISTER_URI = '/api/DoctorRegistration';
  static const String NURSE_REGISTER_URI = '/api/nurseRegistration';
  static const String LAB_REGISTER_URI = '/api/lab/register';
  static const String PHARMACY_REGISTER_URI = '/api/pharmacy/register';
  static const String LOGISTIC_REGISTER_URI = '/api/logistic/register';
  static const String AMBULANCE_REGISTER_URI = '/api/ambulance/register';

  static const String AMBULANCE_LOGIN_URI = '/api/ambulance/login';
  static const String DOCTOR_LOGIN_URI = '/api/doctorlogin';
  static const String NURSE_LOGIN_URI = '/api/nurselogin';
  static const String LAB_LOGIN_URI = '/api/lab/login';
  static const String PHARMACY_LOGIN_URI = '/api/pharmacy/login';
  static const String LOGISTIC_LOGIN_URI = '/api/logistic/login';

  static const String FORGET_PASSWORD_URI = '/api/logistic/login';

  static const String NURSE_SERVICE_LIST_URI = '/api/nurse_services';
  static const String SERVICE_PREFERENCE_LIST_URI = '/api/preferences';
  static const String NURSE_TYPE_LIST_URI = '/api/nurse_type';
  static const String STATE_LIST_URI = '/api/getAllState';

  static const String SET_SERVICE_FEE_NURSE = '/api/nursesetfee';

  static const String ACCEPT_VITAL_SIGN_APPOINTMENTS = '/api/acceptVitalsignRequest';
  static const String CUSTOMER_INFO_NURSE_UPDATE = '/api/updateNurseProfile';

  static const String DOCTOR_TYPE_LIST_URI = '/api/doctor_type';
  static const String CONSULTATION_TYPE_LIST_URI = '/api/preferences';
  static const String CONSULTATION_FEE_URI = '/api/getConsultationFee';
  static const String CONSULTATION_SET_FEE_URI = '/api/setConsultationFee';

  static const String PHARMACY_GET_TRANSACTIONS = '/api/setConsultationFee?token=';
  static const String LAB_GET_TRANSACTIONS = '/api/setConsultationFee?token=';
  static const String DELIVERY_GET_TRANSACTIONS = '/api/setConsultationFee?token=';
  static const String DOCTOR_GET_TRANSACTIONS = '/api/doctransactions';
  static const String NURSE_GET_TRANSACTIONS = '/api/transactions';

  static const String PHARMACY_WITHDRAW = '/api/setConsultationFee?token=';
  static const String LAB_WITHDRAW = '/api/setConsultationFee?token=';
  static const String DELIVERY_WITHDRAW = '/api/setConsultationFee?token=';
  static const String DOCTOR_WITHDRAW = '/api/doc_withdrawal';
  static const String NURSE_WITHDRAW = '/api/nurse_withdrawal';

  static const String PHARMACY_UPDATE_ACCOUNT_INFO = '/api/setConsultationFee?token=';
  static const String LAB_UPDATE_ACCOUNT_INFO = '/api/setConsultationFee?token=';
  static const String DELIVERY_UPDATE_ACCOUNT_INFO = '/api/setConsultationFee?token=';
  static const String DOCTOR_UPDATE_ACCOUNT_INFO = '/api/update_doctor_account';
  static const String NURSE_UPDATE_ACCOUNT_INFO = '/api/update_account';

  static const String NURSE_UPDATE_PROFILE = '/api/updateNurseProfile';
  static const String DOCTOR_UPDATE_PROFILE = '/api/updateDoctorProfile';
  static const String DELIVERY_UPDATE_PROFILE = '/api/updateDoctorProfile';
  static const String PHARMACY_UPDATE_PROFILE = '/api/updateDoctorProfile';
  static const String LAB_UPDATE_PROFILE = '/api/updateDoctorProfile';

  static const String NURSE_GET_REVIEW = '/api/nurse_reviews';
  static const String DOCTOR_GET_REVIEW = '/api/docreviews';
  static const String DELIVERY_GET_REVIEW = '/api/updateDoctorProfile';
  static const String PHARMACY_GET_REVIEW = '/api/updateDoctorProfile';
  static const String LAB_GET_REVIEW = '/api/updateDoctorProfile';

  static const String NURSE_CHECK_EMAIL = '/api/nurse/resetpass';
  static const String DOCTOR_CHECK_EMAIL = '/api/doctor/resetpass';
  static const String DELIVERY_CHECK_EMAIL = '/api/updateDoctorProfile';
  static const String PHARMACY_CHECK_EMAIL = '/api/updateDoctorProfile';
  static const String LAB_CHECK_EMAIL = '/api/updateDoctorProfile';

  static const String NURSE_RESET_PASSWORD = '/api/nurse/setpass';
  static const String DOCTOR_RESET_PASSWORD = '/api/doctor/setpass';
  static const String DELIVERY_RESET_PASSWORD = '/api/updateDoctorProfile';
  static const String PHARMACY_RESET_PASSWORD = '/api/updateDoctorProfile';
  static const String LAB_RESET_PASSWORD = '/api/updateDoctorProfile';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';


  static const appId = "da2e58ec2ef84ca29aa5d23c7523fb82";
  static const vid_chat_token =
      "006da2e58ec2ef84ca29aa5d23c7523fb82IAD8wY/rum5FywzQ1lh/Z8QAB8ykJk6j2wg992nfED8iwmaqFhgAAAAAEABSSZ5eU7w3YQEAAQBSvDdh";

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.english, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    //LanguageModel(imageUrl: Images.arabic, languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
  ];
}
