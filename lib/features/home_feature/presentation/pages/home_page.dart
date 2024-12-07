import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  brightness: Brightness.light,
                  seedColor: AppColor.primaryColor,
                ),
              ),
              child: EasyDateTimeLinePicker(
                focusedDate: DateTime.now(),
                firstDate: DateTime(2024, 3, 18),
                lastDate: DateTime(2030, 3, 18),
                onDateChange: (date) {
                  // Handle the selected date.
                },
              ),
            ),
            const Gap(10),

            TimesSlotGridViewFromInterval(
              selectedColor: AppColor.primaryColor,
              locale: "en",
              initTime: selectedDate,
              crossAxisCount: 4,
              timeSlotInterval: const TimeSlotInterval(
                start: TimeOfDay(hour: 10, minute: 00),
                end: TimeOfDay(hour: 22, minute: 0),
                interval: Duration(hours: 0, minutes: 30),
              ),
              onChange: (value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                ),
                onPressed: () {
                  // Navigate to the next page.
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
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
