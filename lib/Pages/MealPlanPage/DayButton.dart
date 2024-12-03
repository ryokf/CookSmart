import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  const DayButton({super.key, required this.day});

  final String day;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: size.width,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        day,
        style: TextStyle(
          fontSize: fontSizeLarge + 2,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
