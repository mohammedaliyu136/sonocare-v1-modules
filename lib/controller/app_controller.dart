import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';

class AppController extends GetxController implements GetxService {
  String accountType = "";

  setAccountType({accountType}){
    accountType = this.accountType;
  }
}
