class TransactionModel{
  String id = '';
  String status = '';
  String doctorID = '';
  String nurseID = '';
  String type = '';
  String amount = '';
  String createdAT = '';

  TransactionModel({required this.id, required this.status, required this.doctorID, required this.nurseID, required this.type, required this.amount, required this.createdAT});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    doctorID = json['doctor_id']??'';
    nurseID = json['nurse_id']??'';
    type = json['type'];
    amount = json['amount'];
    createdAT = json['created_at'];
  }
}