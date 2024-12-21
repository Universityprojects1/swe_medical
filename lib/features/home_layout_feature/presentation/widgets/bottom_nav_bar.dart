import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/manger/home_layout_cubit.dart';

import '../../../../generated/assets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int selectedIndex = 0;

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
       backgroundColor: AppColor.lightPrimaryColor,
      option: DotBarOptions(),
      items: [
        BottomBarItem(
          icon: SvgPicture.asset(Assets.imagesHome),
          title: const Text('Home'),
          unSelectedColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,

        ),
        BottomBarItem(
          icon: SvgPicture.asset(Assets.imagesMessages),
          title: const Text('chat'),
          unSelectedColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,
        ),
        BottomBarItem(
          icon: SvgPicture.asset(Assets.imagesUserProfile),
          title: const Text('profile'),
          unSelectedColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,
        ),
      ],

      hasNotch: true,
      currentIndex: selectedIndex,
      onTap: (index) {
         context.read<HomeLayoutCubit>().changePage(index);
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
