//LabTestProvider

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/model/response/appointmet_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/review_model.dart';
import 'package:sonocare_partner2/data/model/response/vital_sign_model.dart';
import 'package:sonocare_partner2/data/repository/appointment_repo.dart';
import 'package:sonocare_partner2/data/repository/review_repo.dart';

class AppointmentController extends GetxController implements GetxService {
  final AppointmentRepo appointmentRepo;
  AppointmentController({required this.appointmentRepo}) {
    //_notification = authRepo.isNotificationActive();
  }
  List<AppointmentModel> appointments = [];
  List<AppointmentModel> pendingAppointments = [];

  PatientModel? _patientModel;

  AppointmentModel? appointment;

  PatientModel get patientModel => _patientModel!;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setSelectedAppointment(_appointment){
    appointment=_appointment;
    update();
  }

  Future<ResponseModel> getAppointments({url}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await appointmentRepo.getAppointments(url:url);
    _isLoading = false;
    print('--------2213');
    print(response.status);
    print(response.body);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      appointments = [];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        print('-------------9098');
        print(responseBody.length);
        print(responseBody[i]);
        print(AppointmentModel.fromJson(responseBody[i]));
        appointments.add(AppointmentModel.fromJson(responseBody[i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    update();
    return _responseModel;
  }
  Future<ResponseModel> getDoctorAppointments({url}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await appointmentRepo.getDoctorAppointments(url:url);
    _isLoading = false;
    print('--------2213');
    print(response.status);
    print(response.body);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      appointments = [];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        print('-------------9098');
        print(responseBody.length);
        print(responseBody[i]);
        print(AppointmentModel.fromJson(responseBody[i]));
        appointments.add(AppointmentModel.fromJson(responseBody[i]));
      }
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    update();
    return _responseModel;
  }
  Future<ResponseModel> acceptAppointment({url, vitalID}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await appointmentRepo.acceptAppointment(url:url, vitalID:vitalID);
    _isLoading = false;
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    update();
    return _responseModel;
  }
  Future<ResponseModel> cancelAppointment({url}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await appointmentRepo.cancelAppointment(url:url);
    _isLoading = false;
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    update();
    return _responseModel;
  }



  Future<ResponseModel> getPatientDetail({required String patientID, required String url}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await appointmentRepo.getPatientDetail(patientID:patientID, url: url);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      print(responseBody.length);
      _patientModel = PatientModel.fromJson(responseBody['data']);
      for( var i = 0 ; i < responseBody['vitalsign'].length; i++ ) {
        _patientModel!.vitals.add(VitalSignModel.fromJson(responseBody['vitalsign'][i]));
      }
      _responseModel = ResponseModel(true, 'success');
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, '');
    }
    _isLoading = false;
    update();
    return _responseModel;
  }
  Future<ResponseModel> getAppointmentDetail({required String appointmentID, required int index, required String url}) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await appointmentRepo.getAppointmentDetail(appointmentID:appointmentID, url: url);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      appointments[index].setAppointmentDateTime(responseBody['data'][0]['date'], responseBody['data'][0]['time'], responseBody['data'][0]['day']);
      _responseModel = ResponseModel(true, 'success');
      _isLoading = false;
      update();
    } else {
      String _errorMessage;
      _responseModel = ResponseModel(false, '');
    }
    _isLoading = false;
    update();
    return _responseModel;
  }

  Future<ResponseModel> updateVitalSign(VitalSignModel2 vitalSignModel) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await appointmentRepo.updateVitalSign(vitalSignModel);
    print(response);
    _isLoading = false;
    if (response.statusCode == 200) {

      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, '');
    }
    update();
    return _responseModel;
  }

  //--------doctor-------
  //declineDoctorAppointment

  Future<ResponseModel> acceptDoctorAppointment(String appointment_id, String url) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await appointmentRepo.acceptDoctorAppointments(appointment_id:appointment_id, url:url);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      for( var i = 0 ; i < pendingAppointments.length; i++ ) {
        if(pendingAppointments[i].id==appointment_id){
          pendingAppointments.removeAt(i);
        }
      }
      _responseModel = ResponseModel(true, 'success');
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    _isLoading = false;
    update();
    return _responseModel;
  }
  Future<ResponseModel> cancelDoctorAppointment(String url, String appointmentID) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await appointmentRepo.cancelDoctorAppointment(url: url, appointmentID:appointmentID);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      for( var i = 0 ; i < pendingAppointments.length; i++ ) {
        if(pendingAppointments[i].id==appointmentID){
          pendingAppointments.removeAt(i);
        }
      }
      _responseModel = ResponseModel(true, 'success');
      _isLoading = false;
      update();
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    _isLoading = false;
    update();
    return _responseModel;
  }

}