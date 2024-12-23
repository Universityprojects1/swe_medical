import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/features/profile_feature/presentation/manager/profile_cubit.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';


class EditTypeOfBlood extends StatefulWidget {
  const EditTypeOfBlood({super.key});

  @override
  _EditTypeOfBloodState createState() =>
      _EditTypeOfBloodState();
}

class _EditTypeOfBloodState extends State<EditTypeOfBlood> {

  final List<String> _items = ['A', 'B', 'AB', 'O'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.whitePrimaryColor, AppColor.primaryColor]),
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: DropdownButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        value: context.read<ProfileCubit>().bloodType,
        hint: Text(context.read<ProfileCubit>().bloodType,
            style: TextStyle(
                fontSize:
                AppStyle.responsiveFont(fontSize: 15, context: context),
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w500)),
        isExpanded: true,
        dropdownColor: AppColor.primaryColor,
        icon: const Icon(Icons.arrow_drop_down, color: AppColor.whiteColor),
        style: TextStyle(
            fontSize: AppStyle.responsiveFont(fontSize: 15, context: context),
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w500),
        items: _items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            context.read<ProfileCubit>().bloodType = newValue!;
          });
        },
      ),
    );
  }
}