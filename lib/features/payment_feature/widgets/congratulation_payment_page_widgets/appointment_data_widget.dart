import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';


class AppointmentDateWidget extends StatelessWidget {
  final IconData icon;
  final String date;
  const AppointmentDateWidget({
    super.key,
    required this.icon,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 5,),
        Text(
          date,
          style: TextStyle(
            fontSize: AppStyle.responsiveFont(fontSize: 13, context: context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
