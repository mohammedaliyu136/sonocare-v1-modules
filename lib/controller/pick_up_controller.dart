import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/pickup_model.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/repository/pickup_repo.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';

class PickupController extends GetxController implements GetxService {
  final PickupRepo pickupRepo;
  PickupController({required this.pickupRepo});

  List<PickupRequestsModel> pickupRequests = [];
  List<PickupRequestsModel> pickupRequestsOld = [];

  bool loadingPickup = false;

  Future<void> searchPickupRequests({searchText})async {
    if(pickupRequestsOld.isEmpty || pickupRequestsOld.length==pickupRequests.length){
      pickupRequestsOld = pickupRequests;
    }else{
      pickupRequests = pickupRequestsOld;
    }
    pickupRequests = [];
    for( var i = 0 ; i < pickupRequestsOld.length; i++ ) {
      if(pickupRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        pickupRequests.add(pickupRequestsOld[i]);
      }
    }
    update();
  }

  Future<void> getPickupRequests() async {
    pickupRequests = [];
    loadingPickup = true;
    await Future.delayed(const Duration(seconds: 3));
    /*
    for( var i = 0 ; i < 10; i++ ) {
      pickupRequests.add(PickupRequestsModel(id: '$i', name: 'Pickup request ${i+1}', image: '', location: '24 I.T Igbani Street, Jabi, Abuja', detail: 'To Deliver drugs to patient'));
    }*/
    //---------------------
    pickupRequests.add(PickupRequestsModel(id: '1', name: 'Titi Ogunwande', image: '', location: '62 Yussuf Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '2', name: 'Sekinat Ayobami', image: '', location: '79 Okonkwo Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '3', name: 'Ebiere Maryam', image: '', location: '16 Oluwakemi Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '4', name: 'Alade Bankole Omobolaji', image: '', location: '39 Makuachukwu Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '5', name: 'Buchi Shade Maryam', image: '', location: '73 Emmanuel Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '6', name: 'Cherechi Jolayemi David', image: '', location: '81 Kimberly Street, Abuja', detail: 'To Deliver drugs to patient'));
    pickupRequests.add(PickupRequestsModel(id: '7', name: 'Aminu Zainab Sylvester', image: '', location: '3 25 Okunola Street, Abuja', detail: 'To Deliver drugs to patient'));
    loadingPickup = false;
    update();
  }
}
