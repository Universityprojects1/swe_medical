import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/core/cache/hive/hive_keyes.dart';
import 'package:swe_medical/core/cache/hive/hive_manager.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';

import 'package:swe_medical/features/home_feature/presentation/doctor/pages/doctor_home_page.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/presentation/manger/patient_home_cubit.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/profile_page.dart';
import 'package:swe_medical/features/reminder_feature/reminder_page.dart';



import '../../../../core/di/service_locator.dart';


import '../../../chat_feature/admin.dart';
import '../../../chat_feature/chat_screen.dart';

import '../../../home_feature/presentation/patient/data/repo/patient_home_repo.dart';
import '../../../home_feature/presentation/patient/presentation/pages/home_page.dart';
import '../../../profile_admin/presentation/views/profile_admin_page.dart';
import '../../../record_feature/presentation/pages/record_page.dart';


part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomePageState());

  changePage(int index){
    switch(index){
      case 0:
        emit(HomePageState());
        break;
      case 1:
        emit(MessagePageState());
        break;
      case 2:
        emit(ProfilePageState());
        break;
      case 3:
        emit(ReminderPageState());
        break;
    }
  }

}
