import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/core/di/service_locator.dart';
import '../../../generated/assets.dart';
import '../../config/routes/routes.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () async{
        String? token= await getIt<StorageToken>().getToken();

        if(token != null){
          GoRouter.of(context).pushReplacement(AppRoute.homeLayout);
        }
        else {
          GoRouter.of(context).pushReplacement(AppRoute.onBoarding);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SvgPicture.asset(
      Assets.imagesSplash,
      fit: BoxFit.cover,
      width: double.infinity,
    ));
  }
}
