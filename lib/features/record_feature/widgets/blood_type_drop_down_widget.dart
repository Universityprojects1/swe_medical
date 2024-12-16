import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';

class BloodTypeDropdownWidget extends StatefulWidget {
  const BloodTypeDropdownWidget({super.key});

  @override
  _BloodTypeDropdownWidgetState createState() =>
      _BloodTypeDropdownWidgetState();
}

class _BloodTypeDropdownWidgetState extends State<BloodTypeDropdownWidget> {
  String? _selectedItem;
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
        value: _selectedItem,
        hint: Text('Select Item',
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
            _selectedItem = newValue;
          });
        },
      ),
    );
  }
}