import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
}
