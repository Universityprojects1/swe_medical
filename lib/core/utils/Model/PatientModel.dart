import 'package:hive_flutter/adapters.dart';
part 'PatientModel.g.dart';

@HiveType(typeId: 1)
class PatientModel {
  PatientModel(
      {this.patientId,
      this.name,
      this.address,
      this.email,
      this.phone,
      this.healthRecord,
      this.isHeAssignHealthRecord});

  PatientModel.fromJson(dynamic json) {
    patientId = json['Patient_id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    healthRecord = json['healthRecord'] != null
        ? HealthRecord.fromJson(json['healthRecord'])
        : null;
    isHeAssignHealthRecord = json['isHeAssignHealthRecord'];
  }

  @HiveField(0)
  String? patientId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  HealthRecord? healthRecord;
  @HiveField(6)
  bool? isHeAssignHealthRecord = false;

  PatientModel copyWith({
    String? patientId,
    String? name,
    String? address,
    String? email,
    String? phone,
    HealthRecord? healthRecord,
  }) =>
      PatientModel(
        patientId: patientId ?? this.patientId,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        healthRecord: healthRecord ?? this.healthRecord,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Patient_id'] = patientId;
    map['name'] = name;
    map['address'] = address;
    map['email'] = email;
    map['phone'] = phone;
    if (healthRecord != null) {
      map['healthRecord'] = healthRecord?.toJson();
    }
    map['isHeAssignHealthRecord'] = isHeAssignHealthRecord;
    return map;
  }
}

@HiveType(typeId: 2)
class HealthRecord {
  HealthRecord({
    this.age,
    this.weight,
    this.height,
    this.bloodType,
  });

  HealthRecord.fromJson(dynamic json) {
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    bloodType = json['bloodType'];
  }

  @HiveField(0)
  String? age;
  @HiveField(1)
  num? weight;
  @HiveField(2)
  num? height;
  @HiveField(3)
  String? bloodType;

  HealthRecord copyWith({
    String? age,
    num? weight,
    num? height,
    String? bloodType,
  }) =>
      HealthRecord(
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        bloodType: bloodType ?? this.bloodType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age'] = age;
    map['weight'] = weight;
    map['height'] = height;
    map['bloodType'] = bloodType;
    return map;
  }
}
