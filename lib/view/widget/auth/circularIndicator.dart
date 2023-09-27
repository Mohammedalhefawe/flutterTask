import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/constant/color.dart';


class CircularIndicator extends StatelessWidget {
  final double percent;
  final void Function()? onTap;
  const CircularIndicator({super.key, required this.percent, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
      reverse: true,
      radius: 43.0,
      lineWidth: 5.0,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black12.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ),
      ),
      progressColor: AppColor.primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
