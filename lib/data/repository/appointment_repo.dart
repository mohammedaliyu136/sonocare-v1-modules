import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/api/api_client.dart';
import 'package:sonocare_partner2/util/app_constants.dart';

class AppointmentRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AppointmentRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAppointments({required String url}) async {
    return await apiClient.postData(url, {"status":"all"});
  }
  Future<Response> getDoctorAppointments({required String url}) async {
    return await apiClient.getData(url);
  }
  Future<Response> acceptAppointment({required String url, vitalID}) async {
    //{"status":"all"}
    return await apiClient.postData(url, {"vital_sign_id": vitalID});
  }
  Future<Response> cancelAppointment({required String url}) async {
    return await apiClient.postData(url, {"status":"all"});
  }
  Future<Response> acceptVitalSignAppointments({required String appointment_id, vitalID}) async {
    return await apiClient.postData(AppConstants.ACCEPT_VITAL_SIGN_APPOINTMENTS, {"vital_sign_id": vitalID},);
  }
  Future<Response> cancelDoctorAppointment({required String url, required String appointmentID}) async {
    return await apiClient.postData(url,
        {
          "id":appointmentID,
          "r_date":"01/02/2020",
          "r_time":"10:20AM",
          "r_day":"Morning"
        }
    );}
  Future<Response> acceptDoctorAppointments({required String appointment_id, required String url}) async {
    return await apiClient.postData(url, {"id": appointment_id},);
  }
  /*
  Future<Response> declineAppointments({required String appointment_id}) async {
    return await apiClient.postData(
      AppConstants.DECLINE_APPOINTMENTS,
      {
        'id':appointment_id,
        "r_date":"01/02/2020",
        "r_time":"10:20AM",
        "r_day":"Morning"
      },);
  }
  */
  Future<Response> getAppointmentDetail({required String appointmentID, required String url}) async {
    return await apiClient.postData(url, {'appointment_id':appointmentID},);
  }
  Future<Response> getPatientDetail({required String patientID, required String url}) async {
    return await apiClient.postData(url, {'patient_id':patientID});
  }
  Future<Response> updateVitalSign(vitalSignModel) async {
    return await apiClient.postData('/api/updateVitalSign', vitalSignModel.toJson());
  }
}