import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
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
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: buildAppBar("Profile"),
      body: SingleChildScrollView(
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
                  text: "Your name",
                  title: "Full Name",
                  controller: nameController,
                ),
                const Gap(15),
                CustomEditTextField(
                  text: "example@example.com",
                  title: "Email",
                  controller: emailController,
                  validator: (p0) => ValidationService.validateEmail(p0),
                ),
                const Gap(15),
                CustomEditTextField(
                  text: "***************",
                  title: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                const Gap(15),
                CustomEditTextField(
                  controller: numberController,
                  text: "Your Number",
                  title: "Mobile Number",
                ),
                const Gap(15),
                const EditGender(),
                const Gap(15),
                const EditSlider(
                  title: "How old are you",
                  maxInterval: 100,
                ),
                const Gap(15),
                const EditSlider(
                  title: "What is your weight",
                ),
                const Gap(15),
                const EditSlider(
                  title: "What is your height",
                ),
                const Gap(20),
                const EditTypeOfBlood(),
                const Gap(30),
                Align(
                  alignment: Alignment.center,
                  child: CustomSaveButton(onTap: () {}, title: "Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}