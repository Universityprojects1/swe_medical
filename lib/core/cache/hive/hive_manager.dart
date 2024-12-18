import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swe_medical/core/cache/hive/hive_keyes.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';


class HiveManager {
  void inti() async {
    await Hive.initFlutter();
    _registerAdapter();
    await _openBox();
  }

  void _registerAdapter() {
    Hive.registerAdapter(PatientModelAdapter());

  }

  Future<void> _openBox() async {
    await Hive.openBox<PatientModel>(HiveKeys.patientBox);

  }

  void cacheData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      box.put(0, dataItem);
    }
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);

    return box.values.toList();
  }
  T retrievePerson<T>(String boxKey, int index) {
    var box = Hive.box<T>(boxKey);

    return box.getAt(index)!;
  }

  deleteData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
  }


}