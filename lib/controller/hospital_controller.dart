import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/hospital_model.dart';
import 'package:sonocare_partner2/data/repository/hospital_repo.dart';

class HospitalController extends GetxController implements GetxService {
  final HospitalRepo hospitalRepo;
  HospitalController({required this.hospitalRepo});

  List<HospitalRequestsModel> hospitalRequests = [];
  List<HospitalRequestsModel> hospitalRequestsOld = [];
  List<HospitalServiceModel> hospitalServices= [];
  List<HospitalServiceModel> hospitalServicesOld = [];

  bool loadingHospital = false;

  Future<void> searchHospitalRequests({searchText})async {
    if(hospitalRequestsOld.isEmpty || hospitalRequestsOld.length==hospitalRequests.length){
      hospitalRequestsOld = hospitalRequests;
    }else{
      hospitalRequests = hospitalRequestsOld;
    }
    hospitalRequests = [];
    for( var i = 0 ; i < hospitalRequestsOld.length; i++ ) {
      if(hospitalRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        hospitalRequests.add(hospitalRequestsOld[i]);
      }
    }
    update();
  }
  Future<void> searchHospitalServices({searchText})async {
    if(hospitalServicesOld.isEmpty || hospitalServicesOld.length==hospitalServices.length){
      hospitalServicesOld = hospitalServices;
    }else{
      hospitalServices = hospitalServicesOld;
    }
    hospitalServices = [];
    for( var i = 0 ; i < hospitalServicesOld.length; i++ ) {
      if(hospitalServicesOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        hospitalServices.add(hospitalServicesOld[i]);
      }
    }
    update();
  }

  Future<void> getHospitalRequests() async {
    hospitalRequests = [];
    loadingHospital = true;
    await Future.delayed(const Duration(seconds: 3));
    /*
    for( var i = 0 ; i < 10; i++ ) {
      List<HospitalServiceModel> Services = [];
      for( var t = 0 ; t < 5; t++ ) {
        Services.add(HospitalServiceModel(name: 'Malaria medication $t'));
      }
      hospitalRequests.add(HospitalRequestsModel(id: '$i', name: 'pharm cat $i', Services: Services, image: '', patientProfile: PatientProfileModel(id: '', name: 'Mohammed Aliyu')));
    }*/
    //-------------------
    List<HospitalServiceModel> services = [];
    services.add(HospitalServiceModel(name: 'GP Consultation', id: '', cost: '10,000'));
    services.add(HospitalServiceModel(name: 'Specialist Consultation',  id: '', cost: '200'));
    services.add(HospitalServiceModel(name: 'Antenatal Care',  id: '', cost: '200'));
    services.add(HospitalServiceModel(name: 'Surgery',  id: '', cost: '200'));
    hospitalRequests.add(HospitalRequestsModel(id: '1', name: 'Abigail Alexandra', services: services, image: '', patientProfile: PatientProfileModel(id: '', name: 'Abigail Alexandra'), detail: 'Ante-natal Care', location: 'Gwarinpa, Abuja'));
    hospitalRequests.add(HospitalRequestsModel(id: '2', name: 'Caroline Carolyn', services: services, image: '', patientProfile: PatientProfileModel(id: '', name: 'Caroline Carolyn'), detail: 'Ante-natal Care', location: 'Gwarinpa, Abuja'));
    hospitalRequests.add(HospitalRequestsModel(id: '3', name: 'Lillian Lily', services: services, image: '', patientProfile: PatientProfileModel(id: '', name: 'Lillian Lily'), detail: 'Ante-natal Care', location: 'Gwarinpa, Abuja'));
    hospitalRequests.add(HospitalRequestsModel(id: '4', name: 'Sonia Sophie', services: services, image: '', patientProfile: PatientProfileModel(id: '', name: 'Sonia Sophie'), detail: 'Ante-natal Care', location: 'Gwarinpa, Abuja'));

    //-------------------
    loadingHospital = false;
    update();
  }

  Future<void> getHospitalServices()async{
    hospitalServices = [];
    loadingHospital = true;
    /*
    for( var i = 0 ; i < 10; i++ ) {
      hospitalServices.add(HospitalServiceModel(id: '$i', name: 'pharm product $i'));
    }*/
    hospitalServices.add(HospitalServiceModel(name: 'GP Consultation', id: '', cost: '10,000'));
    hospitalServices.add(HospitalServiceModel(name: 'Specialist Consultation',  id: '', cost: '21,000'));
    hospitalServices.add(HospitalServiceModel(name: 'Antenatal Care',  id: '', cost: '12,000'));
    hospitalServices.add(HospitalServiceModel(name: 'Surgery',  id: '', cost: '200,000'));
    loadingHospital = false;
    update();
  }
  Future<bool> addHospitalService({required HospitalServiceModel hospitalService}) async {
    loadingHospital = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    hospitalServices.add(hospitalService);
    hospitalServicesOld = [];
    loadingHospital = false;
    update();
    return true;
  }
  Future<bool> updateHospitalService({required HospitalServiceModel hospitalService, required int index})async{
    print(index);
    print(hospitalServices[index]);
    hospitalServices[index].name = hospitalService.name;
    hospitalServices[index].cost = hospitalService.cost;
    update();
    return true;
  }
  deleteHospitalTests({required HospitalServiceModel hospitalService}){
    hospitalServices.remove(hospitalService);
  }
}
