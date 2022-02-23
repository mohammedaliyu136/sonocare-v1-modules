class PharmacyRequestsModel{
  String? id;
  String image;
  String name;
  String date = '26th May 2021';
  String time = '12:12pm';
  String deliveryType = 'Self pick up';
  PatientProfileModel patientProfile;
  List<PharmacyProductModel> products;
  PharmacyRequestsModel({this.id, required this.name, required this.image, required this.products, required this.patientProfile});
}

class PatientProfileModel{
  String id;
  String name;
  PatientProfileModel({required this.id, required this.name});
}
class PharmacyProductModel{
  String? id;
  String name;
  String description;
  DrugCategoryModel? category;
  double unitPrice;
  double packPacketPrice;
  String dosage;
  DrugBrandModel brand;
  DrugTypeModel type;
  PharmacyProductModel({
    this.id, required this.name, required this.description, this.category, required this.type,
    required this.brand, required this.unitPrice, required this.packPacketPrice, required this.dosage});
}
class DrugCategoryModel{
  String id;
  String name;
  DrugCategoryModel({required this.id, required this.name});
}
class DrugTypeModel{
  String id;
  String name;
  DrugTypeModel({required this.id, required this.name});
}
class DrugBrandModel{
  String id;
  String name;
  DrugBrandModel({required this.id, required this.name});
}