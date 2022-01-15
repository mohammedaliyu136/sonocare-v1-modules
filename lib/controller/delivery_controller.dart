import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/delivery_model.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/repository/delivery_repo.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';

class DeliveryController extends GetxController implements GetxService {
  final DeliveryRepo deliveryRepo;
  DeliveryController({required this.deliveryRepo});

  List<DeliveryRequestsModel> deliveryRequests = [];
  List<DeliveryRequestsModel> deliveryRequestsOld = [];

  bool loadingDelivery = false;

  Future<void> searchDeliveryRequests({searchText})async {
    if(deliveryRequestsOld.isEmpty || deliveryRequestsOld.length==deliveryRequests.length){
      deliveryRequestsOld = deliveryRequests;
    }else{
      deliveryRequests = deliveryRequestsOld;
    }
    deliveryRequests = [];
    for( var i = 0 ; i < deliveryRequestsOld.length; i++ ) {
      if(deliveryRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        deliveryRequests.add(deliveryRequestsOld[i]);
      }
    }
    update();
  }

  Future<void> getDeliveryRequests() async {
    deliveryRequests = [];
    loadingDelivery = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      deliveryRequests.add(DeliveryRequestsModel(id: '$i', name: 'Delivery request ${i+1}', image: '', location: '24 I.T Igbani Street, Jabi, Abuja', detail: 'To Deliver drugs to patient'));
    }
    loadingDelivery = false;
    update();
  }
}
