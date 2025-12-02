import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  bool active;

  DotsIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: active ? 20 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: active ? AppColors.gold : AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
