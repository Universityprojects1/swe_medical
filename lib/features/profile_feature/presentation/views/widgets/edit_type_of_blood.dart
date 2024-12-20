import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';


class EditTypeOfBlood extends StatefulWidget {
   EditTypeOfBlood({super.key, this.selectedItem});

  @override
  _EditTypeOfBloodState createState() =>
      _EditTypeOfBloodState();
  late String? selectedItem;
}

class _EditTypeOfBloodState extends State<EditTypeOfBlood> {

  final List<String> _items = ['A', 'B', 'AB', 'O'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.whitePrimaryColor, AppColor.primaryColor]),
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: DropdownButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        value: widget.selectedItem,
        hint: Text(widget.selectedItem??"",
            style: TextStyle(
                fontSize:
                AppStyle.responsiveFont(fontSize: 15, context: context),
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w500)),
        isExpanded: true,
        dropdownColor: AppColor.primaryColor,
        icon: const Icon(Icons.arrow_drop_down, color: AppColor.whiteColor),
        style: TextStyle(
            fontSize: AppStyle.responsiveFont(fontSize: 15, context: context),
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w500),
        items: _items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedItem = newValue;
          });
        },
      ),
    );
  }
}