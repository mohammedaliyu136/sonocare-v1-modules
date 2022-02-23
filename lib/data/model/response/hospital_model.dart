class HospitalRequestsModel{
  String? id;
  String image;
  String name;
  String date = '26th May 2021';
  String time = '12:12pm';
  String detail = 'Self pick up';
  String location = 'Self pick up';
  List<HospitalServiceModel> services;
  PatientProfileModel patientProfile;
  HospitalRequestsModel({this.id, required this.name, required this.image, required this.services, required this.detail, required this.location, required this.patientProfile});
}

class PatientProfileModel{
  String id;
  String name;
  PatientProfileModel({required this.id, required this.name});
}
class HospitalCategoryModel{
  String id;
  String name;
  HospitalCategoryModel({required this.id, required this.name});
}

class HospitalServiceModel{
  String? id;
  String name;
  String cost;
  HospitalCategoryModel? pharmacyCategory;
  HospitalServiceModel({this.id, required this.name, this.pharmacyCategory, required this.cost});
}