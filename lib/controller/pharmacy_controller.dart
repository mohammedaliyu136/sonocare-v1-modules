import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/data/repository/pharmacy_repo.dart';

class PharmacyController extends GetxController implements GetxService {
  final PharmacyRepo pharmacyRepo;
  PharmacyController({required this.pharmacyRepo});

  List<PharmacyRequestsModel> pharmacyRequests = [];
  List<PharmacyRequestsModel> pharmacyRequestsOld = [];
  List<PharmacyCategoryModel> pharmacyCategories = [];
  List<PharmacyCategoryModel> pharmacyCategoriesOld = [];
  List<PharmacyProductModel> pharmacyProducts= [];
  List<PharmacyProductModel> pharmacyProductsOld = [];

  bool loadingPharmacy = false;

  Future<void> searchPharmacyCategories({searchText})async {
    if(pharmacyCategoriesOld.isEmpty || pharmacyCategoriesOld.length==pharmacyCategories.length){
      pharmacyCategoriesOld = pharmacyCategories;
    }else{
      pharmacyCategories = pharmacyCategoriesOld;
    }
    pharmacyCategories = [];
    for( var i = 0 ; i < pharmacyCategoriesOld.length; i++ ) {
      if(pharmacyCategoriesOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        pharmacyCategories.add(pharmacyCategoriesOld[i]);
      }
    }
    update();
  }
  Future<void> searchPharmacyRequests({searchText})async {
    if(pharmacyRequestsOld.isEmpty || pharmacyRequestsOld.length==pharmacyRequests.length){
      pharmacyRequestsOld = pharmacyRequests;
    }else{
      pharmacyRequests = pharmacyRequestsOld;
    }
    pharmacyRequests = [];
    for( var i = 0 ; i < pharmacyRequestsOld.length; i++ ) {
      if(pharmacyRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        pharmacyRequests.add(pharmacyRequestsOld[i]);
      }
    }
    update();
  }
  Future<void> searchPharmacyProducts({searchText})async {
    if(pharmacyProductsOld.isEmpty || pharmacyProductsOld.length==pharmacyProducts.length){
      pharmacyProductsOld = pharmacyProducts;
    }else{
      pharmacyProducts = pharmacyProductsOld;
    }
    pharmacyProducts = [];
    for( var i = 0 ; i < pharmacyProductsOld.length; i++ ) {
      if(pharmacyProductsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        pharmacyProducts.add(pharmacyProductsOld[i]);
      }
    }
    update();
  }

  Future<void> getPharmacyRequests() async {
    pharmacyRequests = [];
    loadingPharmacy = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      List<PharmacyProductModel> products = [];
      for( var t = 0 ; t < 5; t++ ) {
        products.add(PharmacyProductModel(name: 'Malaria medication $t'));
      }
      pharmacyRequests.add(PharmacyRequestsModel(id: '$i', name: 'pharm cat $i', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Mohammed Aliyu')));
    }
    loadingPharmacy = false;
    update();
  }

  Future<void> getPharmacyCategories() async {
    pharmacyCategories = [];
    loadingPharmacy = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      pharmacyCategories.add(PharmacyCategoryModel(id: '$i', name: 'pharm cat $i'));
    }
    loadingPharmacy = false;
    update();
  }

  Future<bool> addPharmacyCategory({required PharmacyCategoryModel pharmacyCategoryModel})async {
    loadingPharmacy = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    pharmacyCategories.add(pharmacyCategoryModel);
    pharmacyCategoriesOld = [];
    loadingPharmacy = false;
    update();
    return true;
  }
  Future<void> updatePharmacyCategory({required PharmacyCategoryModel pharmacyCategoryModel})async {
    pharmacyCategories[pharmacyCategories.indexOf(pharmacyCategoryModel)].name = pharmacyCategoryModel.name;
    update();
  }
  Future<void> deletePharmacyCategory({required PharmacyCategoryModel labCategory})async {
    pharmacyCategories.remove(labCategory);
  }
  Future<void> getPharmacyProducts()async{
    pharmacyProducts = [];
    loadingPharmacy = true;
    for( var i = 0 ; i < 10; i++ ) {
      pharmacyProducts.add(PharmacyProductModel(id: '$i', name: 'pharm product $i'));
    }
    loadingPharmacy = false;
    update();
  }
  Future<bool> addPharmacyProduct({required PharmacyProductModel pharmacyProduct}) async {
    loadingPharmacy = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    pharmacyProducts.add(pharmacyProduct);
    pharmacyProductsOld = [];
    loadingPharmacy = false;
    update();
    return true;
  }
  updatePharmacyTests({required PharmacyProductModel pharmacyProduct}){
    pharmacyProducts[pharmacyProducts.indexOf(pharmacyProduct)].name = pharmacyProduct.name;
    update();
  }
  deletePharmacyTests({required PharmacyProductModel pharmacyProduct}){
    pharmacyProducts.remove(pharmacyProduct);
  }
}
