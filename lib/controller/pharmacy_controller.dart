import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/data/repository/pharmacy_repo.dart';

class PharmacyController extends GetxController implements GetxService {
  final PharmacyRepo pharmacyRepo;
  PharmacyController({required this.pharmacyRepo});

  List<PharmacyRequestsModel> pharmacyRequests = [];
  List<PharmacyRequestsModel> pharmacyRequestsOld = [];
  List<DrugCategoryModel> pharmacyCategories = [DrugCategoryModel(id: '', name: 'Antiemetics'),DrugCategoryModel(id: '', name: 'Antigout agents'),DrugCategoryModel(id: '', name: 'Anti-inflammatories'),];
  List<DrugCategoryModel> pharmacyCategoriesOld = [DrugCategoryModel(id: '', name: 'Antiemetics'),DrugCategoryModel(id: '', name: 'Antigout agents'),DrugCategoryModel(id: '', name: 'Anti-inflammatories'),];
  List<PharmacyProductModel> pharmacyProducts= [];
  List<PharmacyProductModel> pharmacyProductsOld = [];

  List<DrugBrandModel> pharmacyBrands = [DrugBrandModel(id: '', name: 'Emzo'),DrugBrandModel(id: '', name: 'J&J'),DrugBrandModel(id: '', name: 'Drug brand'),];
  List<DrugTypeModel> pharmacyTypes = [DrugTypeModel(id: '', name: 'Tablet'),DrugTypeModel(id: '', name: 'Syrup'),DrugTypeModel(id: '', name: 'Capsule'),DrugTypeModel(id: '', name: 'Injection')];

  get mPharmacyCategories => pharmacyCategories;
  get mPharmacyBrands => pharmacyBrands;
  get mPharmacyTypes => pharmacyTypes;

  List<DrugTypeModel> drugTypes = [
    DrugTypeModel(id: '', name: 'Tablet'),
    DrugTypeModel(id: '', name: 'Syrup'),
    DrugTypeModel(id: '', name: 'Capsule'),
    DrugTypeModel(id: '', name: 'Injection')];

  List<DrugBrandModel> drugBrands = [
  DrugBrandModel(id: '', name: 'Emzo'),
  DrugBrandModel(id: '', name: 'J&J'),
  DrugBrandModel(id: '', name: 'Drug brand')
  ];

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
    /*
    for( var i = 0 ; i < 10; i++ ) {
      List<PharmacyProductModel> products = [];
      for( var t = 0 ; t < 5; t++ ) {
        products.add(PharmacyProductModel(name: 'Malaria medication $t'));
      }
      pharmacyRequests.add(PharmacyRequestsModel(id: '$i', name: 'pharm cat $i', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Mohammed Aliyu')));
    }*/
    //-------------------
    List<PharmacyProductModel> products = [];
    DrugTypeModel drugType1 = DrugTypeModel(id: '', name: 'Tablet');
    DrugTypeModel drugType2 = DrugTypeModel(id: '', name: 'Syrup');
    DrugTypeModel drugType3 = DrugTypeModel(id: '', name: 'Capsule');
    DrugTypeModel drugType4 = DrugTypeModel(id: '', name: 'Injection');

    DrugBrandModel drugBrand1 = DrugBrandModel(id: '', name: 'Emzo');
    DrugBrandModel drugBrand2 = DrugBrandModel(id: '', name: 'J&J');
    DrugBrandModel drugBrand3 = DrugBrandModel(id: '', name: 'Drug brand');
    products.add(PharmacyProductModel(name: 'Vitamin C', id: '', unitPrice: 200, type: drugType1, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: 'Acetaminophen is used to treat mild to moderate and pain, to treat moderate to severe pain in conjunction with opiates, or to reduce fever. Common conditions treated include headache, muscle aches, arthritis, backache, toothaches, sore throat, colds, flu, and fevers.'));
    products.add(PharmacyProductModel(name: 'Eye Drop',  id: '', unitPrice: 200, type: drugType2, packPacketPrice: 2000, brand: drugBrand3, dosage: '50/100', description: 'Acetaminophen is used to treat mild to moderate and pain, to treat moderate to severe pain in conjunction with opiates, or to reduce fever. Common conditions treated include headache, muscle aches, arthritis, backache, toothaches, sore throat, colds, flu, and fevers.'));
    products.add(PharmacyProductModel(name: 'Multivitamins',  id: '', unitPrice: 200, type: drugType3, packPacketPrice: 2000, brand: drugBrand2, dosage: '50/100', description: ''));
    products.add(PharmacyProductModel(name: 'Inhaler',  id: '', unitPrice: 200, type: drugType1, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    products.add(PharmacyProductModel(name: 'Ampiclox',  id: '', unitPrice: 200, type: drugType2, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    products.add(PharmacyProductModel(name: 'Postinor',  id: '', unitPrice: 200, type: drugType3, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    products.add(PharmacyProductModel(name: 'Paracetamol',  id: '', unitPrice: 200, type: drugType4, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));

    pharmacyRequests.add(PharmacyRequestsModel(id: '1', name: 'David Dominic', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Abigail Alexandra')));
    pharmacyRequests.add(PharmacyRequestsModel(id: '2', name: 'Harry Ian', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Caroline Carolyn')));
    pharmacyRequests.add(PharmacyRequestsModel(id: '3', name: 'Isaac Jack', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Lillian Lily')));
    pharmacyRequests.add(PharmacyRequestsModel(id: '4', name: 'Jacob Jake', products: products, image: '', patientProfile: PatientProfileModel(id: '', name: 'Sonia Sophie')));

    //-------------------
    loadingPharmacy = false;
    update();
  }

  Future<void> getPharmacyCategories() async {
    pharmacyCategories = [];
    loadingPharmacy = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      pharmacyCategories.add(DrugCategoryModel(id: '$i', name: 'pharm cat $i'));
    }
    loadingPharmacy = false;
    update();
  }

  Future<bool> addPharmacyCategory({required DrugCategoryModel pharmacyCategoryModel})async {
    loadingPharmacy = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    pharmacyCategories.add(pharmacyCategoryModel);
    pharmacyCategoriesOld = [];
    loadingPharmacy = false;
    update();
    return true;
  }
  Future<void> updatePharmacyCategory({required DrugCategoryModel pharmacyCategoryModel})async {
    pharmacyCategories[pharmacyCategories.indexOf(pharmacyCategoryModel)].name = pharmacyCategoryModel.name;
    update();
  }
  Future<void> deletePharmacyCategory({required DrugCategoryModel labCategory})async {
    pharmacyCategories.remove(labCategory);
  }
  Future<void> getPharmacyProducts()async{
    pharmacyProducts = [];
    loadingPharmacy = true;
    /*
    for( var i = 0 ; i < 10; i++ ) {
      pharmacyProducts.add(PharmacyProductModel(id: '$i', name: 'pharm product $i'));
    }*/
    DrugTypeModel drugType1 = DrugTypeModel(id: '', name: 'Tablet');
    DrugTypeModel drugType2 = DrugTypeModel(id: '', name: 'Syrup');
    DrugTypeModel drugType3 = DrugTypeModel(id: '', name: 'Capsule');
    DrugTypeModel drugType4 = DrugTypeModel(id: '', name: 'Injection');

    DrugBrandModel drugBrand1 = DrugBrandModel(id: '', name: 'Emzo');
    DrugBrandModel drugBrand2 = DrugBrandModel(id: '', name: 'J&J');
    DrugBrandModel drugBrand3 = DrugBrandModel(id: '', name: 'Drug brand');
    DrugCategoryModel drugCategory = DrugCategoryModel(id: '', name: 'Antigout agents');
    pharmacyProducts.add(PharmacyProductModel(name: 'Vitamin C', id: '', category: drugCategory, unitPrice: 200, type: drugType2, packPacketPrice: 2000, brand: drugBrand2, dosage: '50/100', description: 'Acetaminophen is used to treat mild to moderate and pain, to treat moderate to severe pain in conjunction with opiates, or to reduce fever. Common conditions treated include headache, muscle aches, arthritis, backache, toothaches, sore throat, colds, flu, and fevers.'));
    pharmacyProducts.add(PharmacyProductModel(name: 'Eye Drop',  id: '', category: drugCategory, unitPrice: 200, type: drugType2, packPacketPrice: 2000, brand: drugBrand2, dosage: '70/100', description: 'Acetaminophen is used to treat mild to moderate and pain, to treat moderate to severe pain in conjunction with opiates, or to reduce fever. Common conditions treated include headache, muscle aches, arthritis, backache, toothaches, sore throat, colds, flu, and fevers.'));
    pharmacyProducts.add(PharmacyProductModel(name: 'Multivitamins',  id: '', unitPrice: 200, type: drugType3, packPacketPrice: 2000, brand: drugBrand2, dosage: '50/100', description: ''));
    pharmacyProducts.add(PharmacyProductModel(name: 'Inhaler',  id: '', unitPrice: 200, type: drugType1, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    pharmacyProducts.add(PharmacyProductModel(name: 'Ampiclox',  id: '', unitPrice: 200, type: drugType2, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    pharmacyProducts.add(PharmacyProductModel(name: 'Postinor',  id: '', unitPrice: 200, type: drugType3, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
    pharmacyProducts.add(PharmacyProductModel(name: 'Paracetamol',  id: '', unitPrice: 200, type: drugType4, packPacketPrice: 2000, brand: drugBrand1, dosage: '50/100', description: ''));
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
