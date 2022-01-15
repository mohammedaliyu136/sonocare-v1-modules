import 'package:get/get.dart';
import 'package:sonocare_partner2/data/repository/map_repo.dart';

class MapController extends GetxController implements GetxService {
  final MapRepo mapRepo;

  MapController({required this.mapRepo}) {
    //_notification = authRepo.isNotificationActive();
  }
  String distance = '0.0';
  double originLatitude = 0.0;
  double originLongitude = 0.0;
  double destinationLatitude = 0.0;
  double destinationLongitude = 0.0;

  setLocation({originLatitude, originLongitude, destinationLatitude, destinationLongitude}){
    this.originLatitude = originLatitude;
    this.originLongitude = originLongitude;
    this.destinationLatitude = destinationLatitude;
    this.destinationLongitude = destinationLongitude;
  }
  setDistance({required String distance}){
    this.distance=distance;
    update();
  }
}