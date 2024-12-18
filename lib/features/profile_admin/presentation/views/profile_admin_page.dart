import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';
import 'package:swe_medical/features/profile_admin/presentation/views/widgets/custom_container.dart';
import 'package:swe_medical/features/profile_admin/presentation/views/widgets/custom_title_and_description.dart';
import 'package:swe_medical/generated/assets.dart';

class ProfileAdminPage extends StatelessWidget {
  const ProfileAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .25,
                  color: AppColor.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.sizeOf(context).height * .01,
                      horizontal: MediaQuery.sizeOf(context).width * .1),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .3,
                            child: Image.asset(Assets.imagesPhoto),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Mostafa",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppStyle.responsiveFont(
                                        fontSize: 16, context: context)),
                              ),
                              subtitle: Text(
                                "Flutter Developer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppStyle.responsiveFont(
                                        fontSize: 14, context: context)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(15),
                      Row(
                        children: [
                          CustomContainer(
                            width: MediaQuery.sizeOf(context).width * .3,
                            widget: ListTile(
                              contentPadding: const EdgeInsets.only(left: 3),
                              minTileHeight: 0,
                              horizontalTitleGap: 0,
                              minVerticalPadding: 0,
                              minLeadingWidth: 25,
                              leading: SvgPicture.asset(Assets.experienceIcon),
                              title: Text(
                                "15 Years",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppStyle.responsiveFont(
                                      fontSize: 12, context: context),
                                ),
                              ),
                              subtitle: Text(
                                "Experience",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AppStyle.responsiveFont(
                                      fontSize: 12, context: context),
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          CustomContainer(
                              widget: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.sizeOf(context).width * .02),
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.alarmIcon),
                                Text(
                                  "Mon-Sat / 9:00AM - 5:00PM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: AppStyle.responsiveFont(
                                        fontSize: 12, context: context),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * .01,
                  horizontal: MediaQuery.sizeOf(context).width * .1),
              child: const Column(
                children: [
                  CustomTitleAndDescription(
                    title: "Profile",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),
                  Gap(10),
                  CustomTitleAndDescription(
                    title: "Career Path",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),  Gap(10),
                  CustomTitleAndDescription(
                    title: "Career Path",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
