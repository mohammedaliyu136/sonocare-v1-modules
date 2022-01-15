class LabRequestsModel{
  String? id;
  String image;
  String name;
  String date = '26th May 2021';
  String time = '12:12pm';
  PatientProfileModel patientProfile;
  List<LabTestModel> tests;
  LabRequestsModel({this.id, required this.name, required this.image, required this.tests, required this.patientProfile});
}

class PatientProfileModel{
  String id;
  String name;
  PatientProfileModel({required this.id, required this.name});
}
class LabCategoryModel{
  String id = '';
  String name = '';
  LabCategoryModel({required this.id, required this.name});

  LabCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class LabTestModel{
  String id = '';
  String name = '';
  String fee = '300';
  bool selected = false;
  LabCategoryModel? labCategory;
  LabTestModel({required this.id, required this.name, required this.fee, this.labCategory});

  LabTestModel.fromJson(Map<String, dynamic> json, labCategory) {
    id = json['id'];
    name = json['name'];
    labCategory = labCategory;
  }

  selectLabTest()=>selected=!selected;
}