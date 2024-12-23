import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
class DoctorImageWidget extends StatelessWidget {
  final String imageUrl;
  const DoctorImageWidget({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage:AssetImage(
          Assets.imagesSmileMan) ,
    );
  }
}
