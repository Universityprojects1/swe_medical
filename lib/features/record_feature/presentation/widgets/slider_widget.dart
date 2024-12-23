import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../core/utils/app_color.dart';


class SliderWidget extends StatelessWidget {
  final int maxInterval;
  final int currentValue;
  final void Function(dynamic)? onChange;
  const SliderWidget(
      {super.key, required this.currentValue, required this.maxInterval, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: 0,
      max: maxInterval,
      value: currentValue,

      showLabels: true,
      stepSize: 1,
      enableTooltip: true,
      tooltipShape: const SfPaddleTooltipShape(),
      onChanged:onChange,
      activeColor: AppColor.primaryColor,
      inactiveColor: AppColor.lightPrimaryColor,
      labelFormatterCallback: (dynamic actualValue, String formattedText) {
        if (actualValue == 0) return '0';
        if (actualValue == maxInterval) return maxInterval.toString();
        return '';
      },
    );
  }
}
