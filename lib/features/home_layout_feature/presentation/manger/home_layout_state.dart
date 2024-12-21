part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {
  Widget get page;
}

final class HomePageState extends HomeLayoutState {
  @override
  Widget get page {
    var patient = getIt<HiveManager>()
        .retrievePerson<PatientModel>(HiveKeys.patientBox, 0);

    "";
    if (patient.patientId == "iRLlMW6ShsMWwp4kjlzoTQj8v6k1") {
      return const DoctorHomePage();
    } else {
      if (patient.isHeAssignHealthRecord!) {
        return BlocProvider(
          create: (context) => PatientHomeCubit(getIt<PatientHomeRepo>()),
          child: const HomePage(),
        );
      }
      else {
        return const RecordPage();
      }
    }
  }
}

final class ProfilePageState extends HomeLayoutState {
  @override
  Widget get page {
    var userId = getIt<HiveManager>()
        .retrievePerson<PatientModel>(HiveKeys.patientBox, 0)
        .patientId ??
        "";
    if (userId == "iRLlMW6ShsMWwp4kjlzoTQj8v6k1") {
      return const ProfileAdminPage();
    } else {
      return const ProfilePage();
    }
  }
}

final class MessagePageState extends HomeLayoutState {
  @override
  Widget get page {
    var userId = getIt<HiveManager>()
        .retrievePerson<PatientModel>(HiveKeys.patientBox, 0)
        .patientId ??
        "";
    if (userId == "iRLlMW6ShsMWwp4kjlzoTQj8v6k1") {
      return const AdminChatRoomsScreen();
    } else {
      return const ChatScreen();
    }
  }
}

