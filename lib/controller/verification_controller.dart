import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sonocare_partner2/data/repository/verification_repo.dart';

class VerificationController extends GetxController implements GetxService {
  final VerificationRepo verificationRepo;
  VerificationController({required this.verificationRepo});

  String token = "";
  bool isUploading = false;
  bool isUploadingPersonalInfo = false;
  bool isUploadingBusinessInfo = false;
  bool isUploadingMedicalInfo = false;
  bool isUploadingPersonalInfo2 = false;

  bool isDoneUploadingPersonalInfo = false;
  bool isDoneUploadingBusinessInfo = false;
  bool isDoneUploadingMedicalInfo = false;
  bool isDoneUploadingPersonalInfo2 = false;

  setToken(token){
    this.token=token;
    update();
  }

  startUpload({required Map<String, dynamic> step1,required Map<String, dynamic> step2,required Map<String, dynamic> step3,required Map<String, dynamic> step4, passport, idCard, degreeCertificate, nigerianMedicalCertificate, specialistDoc}) async {
    isUploadingPersonalInfo = false;
    isUploadingBusinessInfo = false;
    isUploadingMedicalInfo = false;
    isUploadingPersonalInfo2 = false;

    isDoneUploadingPersonalInfo = false;
    isDoneUploadingBusinessInfo = false;
    isDoneUploadingMedicalInfo = false;
    isDoneUploadingPersonalInfo2 = false;
    this.token=token;
    //await uploadPersonalInfo(step1, passport);
    //await uploadBusinessInfo(step2, idCard);
    //await uploadMedicalInfo(step3, degreeCertificate, nigerianMedicalCertificate, specialistDoc);
    //await uploadPersonalInfo2(step4);
    if(isDoneUploadingBusinessInfo&&isDoneUploadingBusinessInfo&&isDoneUploadingMedicalInfo&&isDoneUploadingPersonalInfo2){
      return true;
    }else{
      return false;
    }
  }

  uploadPersonalInfo(Map<String, dynamic> step, passport) async {
    isUploading = true;
    isUploadingPersonalInfo=true;
    update();
    String token = this.token;
    StreamedResponse response = await verificationRepo.personalInformationVerification(step, passport, token);
    if(response.statusCode==200){
      isUploadingPersonalInfo=false;
      isDoneUploadingPersonalInfo=true;
    }else{

    }
    //await Future.delayed(Duration(seconds: 3));
    isUploadingPersonalInfo=false;
    isDoneUploadingPersonalInfo=true;
    update();
  }
  uploadBusinessInfo(Map<String, dynamic> step, idCard) async {
    isUploadingBusinessInfo=true;
    update();
    String token = this.token;
    StreamedResponse response = await verificationRepo.businessInformationVerification(step, idCard, token);
    if(response.statusCode==200){
      isUploadingBusinessInfo=false;
      isDoneUploadingBusinessInfo=true;
    }else{

    }
    //await Future.delayed(Duration(seconds: 3));
    isUploadingBusinessInfo=false;
    isDoneUploadingBusinessInfo=true;
    update();
  }
  uploadMedicalInfo(Map<String, dynamic> step, degreeCertificate, nigerianMedicalCertificate, specialistDoc) async {
    isUploadingMedicalInfo=true;
    update();
    StreamedResponse response = await verificationRepo.medicalInformationVerification(step, degreeCertificate, nigerianMedicalCertificate, specialistDoc, token);
    if(response.statusCode==200){
      isUploadingMedicalInfo=false;
      isDoneUploadingMedicalInfo = true;
    }else{

    }
    await Future.delayed(Duration(seconds: 3));
    isUploadingMedicalInfo=false;
    isDoneUploadingMedicalInfo = true;
    update();
  }
  uploadPersonalInfo2(Map<String, dynamic> step) async {
    isUploadingPersonalInfo2=true;
    update();
    StreamedResponse response = await verificationRepo.professionalInformationVerification(step, token);
    if(response.statusCode==200){
      isUploadingPersonalInfo2=false;
      isDoneUploadingPersonalInfo2 = true;
    }else{

    }
    await Future.delayed(Duration(seconds: 3));
    isUploadingPersonalInfo2=false;
    isDoneUploadingPersonalInfo2 = true;
    isUploading = false;
    update();
  }

}
