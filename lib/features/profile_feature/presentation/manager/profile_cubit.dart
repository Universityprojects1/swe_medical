import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/features/profile_feature/data/repo/repo_profile.dart';
import 'package:swe_medical/features/profile_feature/data/repo/repo_profile_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  RepoProfile repoProfile = RepoProfileImpl();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  num height = 0;
  num weight = 0;
  int age = 0;
  String gender = "male";
  String bloodType = "A";

  getProfileData() async {
    emit(ProfileLoading());
    var response = await repoProfile.getProfileData();
    response.fold((error) => emit(ProfileFailure(error.message)), (res) {
      emit(ProfileSuccessful(res));
      nameController.text = res.name!;
      emailController.text = res.email!;
      numberController.text = res.phone!;
      age = int.parse(res.healthRecord!.age!);
      bloodType = res.healthRecord!.bloodType!;
      height = res.healthRecord!.height!;
      weight = res.healthRecord!.weight!;
      gender = res.healthRecord!.gender!;
    });
  }

  updateProfileData() async {
    await repoProfile.updateProfileData(PatientModel(
      name: nameController.text,
      email: emailController.text,
      phone: numberController.text,
      isHeAssignHealthRecord: true,
      healthRecord: HealthRecord(
        height: height,
        weight: weight,
        age: age.toString(),
        bloodType: bloodType,
        gender: gender,
      ),
    ));
    getProfileData();
  }
}
