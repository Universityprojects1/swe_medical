import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

import 'info_line_widget.dart';
class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
        Divider(
          thickness: 1,
          color: AppColor.lightPrimaryColor,
          indent: 30,
          endIndent: 30,
        ),
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
        InfoLineWidget(
          label: "Date/Hour",
          field: "Month 24, Year / 10:00 aM",
        ),
      ],
    );
  }
}
