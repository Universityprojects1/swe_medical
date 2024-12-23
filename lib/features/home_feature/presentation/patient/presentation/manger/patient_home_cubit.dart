import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/repo/patient_home_repo.dart';

part 'patient_home_state.dart';

class PatientHomeCubit extends Cubit<PatientHomeState> {
  PatientHomeRepo patientHomeRepo;

  PatientHomeCubit(this.patientHomeRepo) : super(PatientHomeInitial());

  addAppointment(AppointmentModel appointmentModel) async {
    emit(AddAppointmentLoadingState());
    var result = await patientHomeRepo.addAppointment(appointmentModel);
    result.fold(
      (l) => emit(AddAppointmentErrorState(l.message)),
      (r) => emit(AddAppointmentSuccessState()),
    );
  }
}
