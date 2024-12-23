import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/core/api/fire_base_helper.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/repo/patient_home_repo.dart';

import '../../data/model/AppointmentModel.dart';

part 'doctor_home_state.dart';

class DoctorHomeCubit extends Cubit<DoctorHomeState> {
  PatientHomeRepo patientHomeRepo;

  DoctorHomeCubit(this.patientHomeRepo) : super(DoctorHomeInitial());

  getAllAppointment() async {
    emit(GetAllAppointmentLoadingState());
    var result = await patientHomeRepo.getAllAppointment();
    result.fold(
      (failure) => emit(GetAllAppointmentErrorState(failure.message)),
      (success) => emit(GetAllAppointmentSuccessState(success)),
    );
  }

  confirmAppointment(String dateTime) async {
    try {
      await FireBaseHelper.docRefForAppointmentToFireStore(
              dateTime, AppointmentModel())
          .update({'is_confirmed': true});
      getAllAppointment();
    } catch (e) {
      return ServerFailure(e.toString());
    }
  }
  deleteAppointment(String dateTime)
      async{
        try {
          await FireBaseHelper.docRefForAppointmentToFireStore(
              dateTime, AppointmentModel())
              .delete();
          getAllAppointment();
        } catch (e) {
          return ServerFailure(e.toString());
        }

  }

}
