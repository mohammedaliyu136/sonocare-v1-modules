import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/prescription_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/repository/prescription_repo.dart';

class PrescriptionController extends GetxController implements GetxService {
  final PrescriptionRepo prescriptionRepo;
  PrescriptionController({required this.prescriptionRepo}) {
    //_notification = authRepo.isNotificationActive();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> setPrescription(PrescriptionModel prescriptionModel, String url) async {
    
    _isLoading = true;
    update();
    ResponseModel _responseModel;

    Response response = await prescriptionRepo.setPrescription(prescriptionModel, url);
    _isLoading = false;
    if (response.statusCode == 200) {

      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'error');
    }
    update();
    return _responseModel;
  }

}