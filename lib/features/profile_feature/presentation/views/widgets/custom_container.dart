import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * .015),
      decoration: BoxDecoration(
          color: const Color(0xffE9F6FE),
          borderRadius: BorderRadius.circular(15)),
      child: widget,
    );
  }
}
