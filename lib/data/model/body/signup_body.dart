class LabSignUpBody {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String serviceID = '';

  LabSignUpBody({required this.name,required this.phone,required this.email, required this.password, required this.serviceID,});

  LabSignUpBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceID = json['service_id'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['service_id'] = this.serviceID;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class PharmacySignUpBody {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String serviceID = '';

  PharmacySignUpBody({required this.name,required this.phone,required this.email, required this.password, required this.serviceID,});

  PharmacySignUpBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceID = json['service_id'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['service_id'] = this.serviceID;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class AmbulanceSignUpBody {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String serviceID = '';
  String dob = '';
  String lgaID = '';
  String stateID = '';
  String fee = '';

  AmbulanceSignUpBody({required this.name,required this.phone,required this.email, required this.password,
    required this.serviceID, required this.dob, required this.lgaID, required this.stateID, required this.fee });

  AmbulanceSignUpBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceID = json['service_id'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    lgaID = json['lga_id'];
    stateID = json['state_id'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['service_id'] = this.serviceID;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;

    data['dob'] = this.dob;
    data['lga_id'] = this.lgaID;
    data['state_id'] = this.stateID;
    data['fee'] = this.fee;
    return data;
  }
}

class LogisticSignUpBody {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String serviceID = '';
  String dob = '';
  String lgaID = '';
  String stateID = '';
  String fee = '';

  LogisticSignUpBody({required this.name,required this.phone,required this.email, required this.password,
    required this.serviceID, required this.dob, required this.lgaID, required this.stateID, required this.fee });

  LogisticSignUpBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceID = json['service_id'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    lgaID = json['lga_id'];
    stateID = json['state_id'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['service_id'] = this.serviceID;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;

    data['dob'] = this.dob;
    data['lga_id'] = this.lgaID;
    data['state_id'] = this.stateID;
    data['fee'] = this.fee;
    return data;
  }
}

class DoctorSignUpBody {
  String firstName = '';
  String lastName = '';
  String otherName = '';
  String phone = '';
  String email = '';
  String password = '';
  String serviceID = '';
  String doctorType = '';

  DoctorSignUpBody({required this.firstName,required this.lastName,required this.otherName,required this.phone,required this.email, required this.password,
    required this.serviceID, required this.doctorType});

  DoctorSignUpBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    otherName = json['other_name'];
    serviceID = json['service_preferences'];
    phone = json['phone_number'];
    email = json['email'];
    password = json['password'];
    doctorType = json['doctor_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['other_name'] = this.otherName;
    data['service_preferences'] = this.serviceID;
    data['phone_number'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['doctor_type'] = this.doctorType;
    return data;
  }
}

class NurseSignUpBody {
  String firstName = '';
  String lastName = '';
  String otherName = '';
  String phone = '';
  String address = '';
  String email = '';
  String password = '';
  String serviceID = '';
  String nurseType = '';
  String nurseService = '';
  String hospitalID = '';

  NurseSignUpBody({required this.firstName,required this.lastName,required this.otherName,required this.phone,required this.email, required this.password,
    required this.serviceID, required this.nurseType, required this.nurseService, required this.address, required this.hospitalID});

  NurseSignUpBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_names'];
    otherName = json['other_names'];
    serviceID = json['service_preferences'];
    phone = json['phone_number'];
    email = json['email'];
    password = json['password'];
    nurseType = json['nurse_type'];
    nurseService = json['nurse_service'];
    hospitalID = json['hospital_id'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_names'] = this.lastName;
    data['other_names'] = this.otherName;
    data['service_preferences'] = this.serviceID;
    data['phone_number'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['nurse_type'] = this.nurseType;
    data['nurse_service'] = this.nurseService;
    data['address'] = this.address;
    data['hospital_id'] = this.hospitalID;
    return data;
  }
}