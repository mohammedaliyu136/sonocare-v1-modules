class PharmacyRequestsModel{
  String? id;
  String image;
  String name;
  String date = '26th May 2021';
  String time = '12:12pm';
  PatientProfileModel patientProfile;
  List<PharmacyProductModel> products;
  PharmacyRequestsModel({this.id, required this.name, required this.image, required this.products, required this.patientProfile});
}

class PatientProfileModel{
  String id;
  String name;
  PatientProfileModel({required this.id, required this.name});
}
class PharmacyCategoryModel{
  String id;
  String name;
  PharmacyCategoryModel({required this.id, required this.name});
}

class PharmacyProductModel{
  String? id;
  String name;
  PharmacyCategoryModel? pharmacyCategory;
  PharmacyProductModel({this.id, required this.name, this.pharmacyCategory});
}