import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/components/widgets.dart';

class BottomNavigationSteps extends StatelessWidget {
  final int step;
  final int total;
  final String? lastPageButtonText;
  final Function()? next;
  final Function()? previous;
  const BottomNavigationSteps(
      {required this.step,
      required this.total,
      this.previous,
      this.next,
      this.lastPageButtonText});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedFontSize: 0,
      selectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      items: [
        BottomNavigationBarItem(
          icon: CustomIconButtons.backArrow(
              onPressed: step > 1 ? previous ?? () => Get.back() : previous),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Text('$step/$total',
                style: AppTextStyles.boldText(
                    size: 20.0, color: AppColors.footerWhiteText)),
            label: ''),
        BottomNavigationBarItem(
          icon: lastPageButtonText != null
              ? AppRectangularButton(
                  text: lastPageButtonText!.toUpperCase(),
                  yellowButton: true,
                  onPressed: next,
                )
              : CustomIconButtons.forwardArrow(onPressed: next),
          label: '',
        ),
      ],
    );
  }
}
