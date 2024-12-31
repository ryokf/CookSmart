import 'package:cook_smart/Components/InfoCard.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection(
      {super.key,
      required this.timeCooking,
      required this.calories,
      required this.healthScore});

  final int? timeCooking;
  final double? calories;
  final int? healthScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InfoCard(
            icon: Icons.timer,
            title: "time cooking",
            value: "$timeCooking minute",
          ),
          const SizedBox(width: 12),
          InfoCard(
              icon: Icons.local_fire_department,
              title: "calories",
              value: "$calories kkal"),
          const SizedBox(width: 12),
          InfoCard(
            // icon: Icons.health_and_safety,
            icon: healthScore! > 80 ? Icons.sentiment_satisfied_alt : Icons.sentiment_dissatisfied,
            title: "health score",
            value: "$healthScore",
          ),
        ]));
  }
}
