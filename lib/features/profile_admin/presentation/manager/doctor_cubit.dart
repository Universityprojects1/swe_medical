import 'package:bloc/bloc.dart';
import 'package:swe_medical/features/profile_admin/data/model/doctor_model.dart';
import 'package:swe_medical/features/profile_admin/data/repo/repo_doctor.dart';
import 'package:swe_medical/features/profile_admin/data/repo/repo_doctor_impl.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  RepoDoctor repoDoctor = RepoDoctorImpl();

  getData() async {
    emit(DoctorLoading());
    var response = await repoDoctor.getProfileData();
    response.fold((error) => emit(DoctorFailure(error.message)),
        (res) => emit(DoctorSuccessful(res)));
  }
}
