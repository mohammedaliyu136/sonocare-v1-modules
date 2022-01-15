class SpecialtyType{
  String id = '';
  String title = '';
  SpecialtyType({required this.id, required this.title});
  SpecialtyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['name'];
  }
}