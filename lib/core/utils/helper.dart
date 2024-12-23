
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:swe_medical/core/cache/hive/hive_keyes.dart';
import 'package:swe_medical/core/cache/hive/hive_manager.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';

abstract class Helper {
  static String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  static String dateToString(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

 static  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE4DFDF)),
      borderRadius: BorderRadius.circular(12),
    );
  }
  static  PatientModel  returnUser(){
    var patient =HiveManager().retrievePerson<PatientModel>(HiveKeys.patientBox, 0);
    return patient;


  }
}
