import 'package:bloc/bloc.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/features/profile_feature/data/repo/repo_profile.dart';
import 'package:swe_medical/features/profile_feature/data/repo/repo_profile_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  RepoProfile repoProfile = RepoProfileImpl();

  getProfileData() async {
    emit(ProfileLoading());
    var response = await repoProfile.getProfileData();
    response.fold((error) => emit(ProfileFailure(error.message)),
        (res) => emit(ProfileSuccessful(res)));
  }
}
