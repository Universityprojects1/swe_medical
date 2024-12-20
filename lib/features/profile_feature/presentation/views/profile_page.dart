import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/profile_feature/presentation/manager/profile_cubit.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_edit_text_field.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_save_button.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/edit_gender.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/edit_slider.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/edit_type_of_blood.dart';
import '../../../../core/services/validation_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: Scaffold(
        appBar: buildAppBar("Profile"),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccessful) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .08,
                      vertical: MediaQuery.sizeOf(context).height * .03),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomEditTextField(
                          text: state.patientModel.name ?? "",
                          title: "Full Name",
                          controller:
                              context.read<ProfileCubit>().nameController,
                        ),
                        const Gap(15),
                        CustomEditTextField(
                          text: state.patientModel.email ?? "",
                          title: "Email",
                          controller:
                              context.read<ProfileCubit>().emailController,
                          validator: (p0) =>
                              ValidationService.validateEmail(p0),
                        ),
                        const Gap(15),
                        CustomEditTextField(
                          controller:
                              context.read<ProfileCubit>().numberController,
                          text: state.patientModel.phone ?? "",
                          title: "Mobile Number",
                        ),
                        const Gap(15),
                        EditGender(
                          gender: state.patientModel.healthRecord!.gender ?? "",
                        ),
                        const Gap(15),
                        EditSlider(
                          title: "How old are you?",
                          age: int.parse(
                              state.patientModel.healthRecord!.age ?? "0"),
                          maxInterval: 100,
                        ),
                        const Gap(15),
                        EditSlider(
                          title: "What is your weight?",
                          weight: state.patientModel.healthRecord!.weight ?? 0,
                        ),
                        const Gap(15),
                        EditSlider(
                          title: "What is your height?",
                          height: state.patientModel.healthRecord!.height ?? 0,
                        ),
                        const Gap(20),
                        const EditTypeOfBlood(),
                        const Gap(30),
                        Align(
                          alignment: Alignment.center,
                          child: CustomSaveButton(
                              onTap: () {
                                context
                                    .read<ProfileCubit>()
                                    .updateProfileData();
                              },
                              title: "Save"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileFailure) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
