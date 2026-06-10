import 'package:flutter/material.dart';
import 'package:nick_me/assets_helper/app_colors.dart';

class CustomDatePicker {
  static Future<void> pickDate(
    BuildContext context, {
    required TextEditingController controller,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1975),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColor.cFFFFFF,
              onPrimary: AppColor.c000000,
              surface: AppColor.c000000,
              onSurface: AppColor.cFFFFFF,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    }
  }
}
