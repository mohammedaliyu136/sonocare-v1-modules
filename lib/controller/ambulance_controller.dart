import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/ambulance_model.dart';
import 'package:sonocare_partner2/data/model/response/delivery_model.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/repository/ambulance_repo.dart';
import 'package:sonocare_partner2/data/repository/delivery_repo.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';

class AmbulanceController extends GetxController implements GetxService {
  final AmbulanceRepo ambulanceRepo;
  AmbulanceController({required this.ambulanceRepo});

  List<AmbulanceRequestsModel> ambulanceRequests = [];
  List<AmbulanceRequestsModel> ambulanceRequestsOld = [];

  bool loadingDelivery = false;

  Future<void> searchAmbulanceRequests({searchText})async {
    if(ambulanceRequestsOld.isEmpty || ambulanceRequestsOld.length==ambulanceRequests.length){
      ambulanceRequestsOld = ambulanceRequests;
    }else{
      ambulanceRequests = ambulanceRequestsOld;
    }
    ambulanceRequests = [];
    for( var i = 0 ; i < ambulanceRequestsOld.length; i++ ) {
      if(ambulanceRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        ambulanceRequests.add(ambulanceRequestsOld[i]);
      }
    }
    update();
  }

  Future<void> getAmbulanceRequests() async {
    ambulanceRequests = [];
    loadingDelivery = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      ambulanceRequests.add(AmbulanceRequestsModel(id: '$i', name: 'Ambulance request ${i+1}', image: '', location: '24 I.T Igbani Street, Jabi, Abuja', detail: 'To Deliver drugs to patient'));
    }
    loadingDelivery = false;
    update();
  }
}
