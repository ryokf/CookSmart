import 'package:cook_smart/Components/InfoCard.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InfoCard(icon: Icons.timer, title: "time cooking", value: "20 menit"),
          SizedBox(width: 12),
          InfoCard(
              icon: Icons.local_fire_department,
              title: "calories",
              value: "100 cal"),
          SizedBox(width: 12),
          InfoCard(
            icon: Icons.star,
            title: "rating",
            value: "4.5",
          ),
        ]));
  }
}
