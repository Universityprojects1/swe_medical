class AppointmentModel {
  AppointmentModel({
    this.patientId,
    this.patientName,
    this.patientGender,
    this.date,
    this.time,
    this.dateTime,
    this.isConfirmed=false,
    this.isPaid=false,
  });

  AppointmentModel.fromJson(dynamic json) {
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    patientGender = json['patient_gender'];
    date = json['date'];
    time = json['time'];
    dateTime = json['date_time'];
    isConfirmed = json['is_confirmed'];
    isPaid = json['is_paid'];
  }

  String? patientId;
  String? patientName;
  String? patientGender;
  String? date;
  String? time;
  String? dateTime;
  bool? isConfirmed ;
  bool? isPaid ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_id'] = patientId;
    map['patient_name'] = patientName;
    map['patient_gender'] = patientGender;
    map['date'] = date;
    map['time'] = time;
    map['date_time'] = dateTime;
    map['is_confirmed'] = isConfirmed;
    map['is_paid'] = isPaid;
    return map;
  }
}
