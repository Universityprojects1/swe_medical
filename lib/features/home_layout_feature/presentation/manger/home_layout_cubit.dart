import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:swe_medical/features/home_feature/presentation/doctor/pages/doctor_home_page.dart';
import 'package:swe_medical/features/profile_feature/profile_page.dart';
import 'package:swe_medical/features/reminder_feature/reminder_page.dart';

import '../../../chat_feature/chat_screen.dart';


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
