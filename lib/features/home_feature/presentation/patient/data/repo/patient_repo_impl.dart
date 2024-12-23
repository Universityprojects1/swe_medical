import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/repo/patient_home_repo.dart';
import '../../../../../../core/api/fire_base_helper.dart';

class PatientHomeRepoImpl implements PatientHomeRepo {
  @override
  Future<Either<Failure, String>> addAppointment(
      AppointmentModel appointmentModel) async {
    List<AppointmentModel> list = [];
    try {
      var docRef = FireBaseHelper.docRefForAppointmentToFireStore(
          appointmentModel.dateTime ?? "", appointmentModel);
      bool isExist = await checkIfAppointmentExist(list, appointmentModel);
      bool isPaid = await checkIfAppointmentPaid(list, appointmentModel);
      if (isExist&&!isPaid) {
        return Left(ServerFailure("Appointment Already Exist"));
      } else if (isPaid) {
        await docRef.set(appointmentModel);
        return const Right("Appointment Added Successfully");
      } else {
        await docRef.set(appointmentModel);
        return const Right("Appointment Added Successfully");
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<bool> checkIfAppointmentExist(
      List<AppointmentModel> list, AppointmentModel appointmentModel) async {
    var result = await getAllAppointment();
    result.fold((l) => null, (r) => list = r);
    bool isExist =
        list.any((element) => element.dateTime == appointmentModel.dateTime);
    return isExist;
  }

  Future<bool> checkIfAppointmentPaid(
      List<AppointmentModel> list, AppointmentModel appointmentModel) async {
    var result = await getAllAppointment();
    result.fold((l) => null, (r) => list = r);
    for (var element in list) {
      if (element.dateTime == appointmentModel.dateTime &&
          element.patientId == appointmentModel.patientId) {
        if (element.isPaid == false) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getAllAppointment() async {
    try {
      var docRef = FireBaseHelper.collectionRefForAppointmentFromFireStore(
          AppointmentModel());
      var response = await docRef.get();
      return Right(response.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
