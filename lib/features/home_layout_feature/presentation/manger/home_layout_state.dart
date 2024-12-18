part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {
  Widget get page;
}

final class HomePageState extends HomeLayoutState {
  @override
  Widget get page {
    var userId = getIt<HiveManager>()
            .retrievePerson<PatientModel>(HiveKeys.patientBox, 0)
            .patientId ??
        "";
    if (userId == "iRLlMW6ShsMWwp4kjlzoTQj8v6k1") {
      return const DoctorHomePage();
    } else {
       return const HomePage();
    }
  }
}

final class ProfilePageState extends HomeLayoutState {
  @override
  Widget get page => const ProfilePage();
}

final class MessagePageState extends HomeLayoutState {
  @override
  Widget get page => const ChatScreen();
}

final class ReminderPageState extends HomeLayoutState {
  @override
  Widget get page => const ReminderPage();
}
