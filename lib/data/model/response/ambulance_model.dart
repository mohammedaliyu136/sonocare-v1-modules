class AmbulanceRequestsModel{
  String? id;
  String image;
  String name;
  String detail;
  String location;
  String date = '26th May 2021';
  String time = '12:12pm';
  AmbulanceRequestsModel({this.id, required this.name, required this.image, required this.detail, required this.location});
}