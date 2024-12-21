import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/helper.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';
import '../manger/patient_home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime selectTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(
                    brightness: Brightness.light,
                    primarySwatch: Colors.cyan,
                  ),
                ),
                child: EasyDateTimeLinePicker(
                  focusedDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030, 3, 18),
                  onDateChange: (date) {
                    selectedDate = date;
                    setState(() {});
                    // Handle the selected date.
                  },
                ),
              ),
              const Gap(10),
              TimesSlotGridViewFromInterval(
                selectedColor: AppColor.primaryColor,
                locale: "en",
                initTime: selectTime,
                crossAxisCount: 4,
                timeSlotInterval: const TimeSlotInterval(
                  start: TimeOfDay(hour: 10, minute: 00),
                  end: TimeOfDay(hour: 22, minute: 0),
                  interval: Duration(hours: 0, minutes: 30),
                ),
                onChange: (value) {
                  setState(() {
                    selectTime = value;
                  });
                },
              ),
              const Gap(10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                  ),
                  onPressed: () {
                    AppointmentModel appointmentModel = getAppointmentData();
                    context.read<PatientHomeCubit>().addAppointment(
                        appointmentModel);
                  },
                  child: BlocConsumer<PatientHomeCubit, PatientHomeState>(
                    listener: (context, state) {
                      if(state is AddAppointmentSuccessState){
                        context.push(AppRoute.payment,extra: getAppointmentData());
                      }
                    },
                    builder: (context, state) {
                      if(state is AddAppointmentLoadingState){
                        return const CircularProgressIndicator();
                      }
                      else if(state is AddAppointmentErrorState){
                        return Text(state.message);
                      }
                      return const Text(
                        'Book Appointment',
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppointmentModel getAppointmentData() {
     PatientModel patientData = Helper.returnUser();
    AppointmentModel appointmentModel = AppointmentModel(
      date: Helper.dateToString(selectedDate),
      time: Helper.formatTime(selectTime),
      patientId: patientData.patientId,
      patientName: patientData.name,
      dateTime: "${Helper.dateToString(selectedDate)} ${Helper
          .formatTime(selectTime)}",
      patientGender: patientData.healthRecord?.gender,

    );
    return appointmentModel;
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        time,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
