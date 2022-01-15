class VitalSignModel{
  String id = '';
  String patientID = '';
  String nurseID = '';
  String bloodGroup = '';
  String temperature = '';
  String pulseRate = '';
  String respiration = '';
  String sp02 = '';
  String bodyMass = '';
  String status = '';
  String createdAt = '';
  String updatedAt = '';
  VitalSignModel({
    required this.id,
    required this.patientID,
    required this.nurseID,
    required this.bloodGroup,
    required this.temperature,
    required this.pulseRate,
    required this.respiration,
    required this.sp02,
    required this.bodyMass,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });


  VitalSignModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientID = json['patient_id'];
    nurseID = json['nurse_id']??'';
    bloodGroup = json['blood_group']??'';
    temperature = json['temprature']??'';
    pulseRate = json['pulse_rate']??'';
    respiration = json['respiration']??'';
    sp02 = json['sp02']??'';
    bodyMass = json['body_mass']??'';
    status = json['status']??'';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class VitalSignModel2 {
  late int vitalSignId;
  late String bloodPressure;
  late String temperature;
  late String pulseRate;
  late String respiration;
  late String sp02;
  late String bodyMassIdex;

  VitalSignModel2({required this.vitalSignId, required this.bloodPressure, required this.temperature, required this.pulseRate, required this.respiration, required this.sp02, required this.bodyMassIdex});

  VitalSignModel2.fromJson(Map<String, dynamic> json) {}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vitalsign_id'] = vitalSignId.toString();
    data['blood_group'] = bloodPressure;
    data['temprature'] = temperature;
    data['pulse_rate'] = pulseRate;
    data['respiration'] = respiration;
    data['sp02'] = sp02;
    data['body_mass'] = bodyMassIdex;
    return data;
  }
}

class PatientModel{
  String id = '';
  String firstName = '';
  String otherName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String image = '';
  List<VitalSignModel> vitals = [];

  String gender = '';
  String genoType = '';
  String bloodGroup = '';
  String dob = '';

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    otherName = json['other_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image']??'';

    genoType = json['genotype'] ?? '';
    bloodGroup = json['blood_group'] ?? '';
    dob = json['dob'] ?? '';
    gender = json['gender'] ?? '';
  }
}